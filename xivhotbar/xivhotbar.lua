--[[    BSD License Disclaimer
        Copyright © 2017, SirEdeonX
        All rights reserved.

        Redistribution and use in source and binary forms, with or without
        modification, are permitted provided that the following conditions are met:

            * Redistributions of source code must retain the above copyright
              notice, this list of conditions and the following disclaimer.
            * Redistributions in binary form must reproduce the above copyright
              notice, this list of conditions and the following disclaimer in the
              documentation and/or other materials provided with the distribution.
            * Neither the name of xivhotbar nor the
              names of its contributors may be used to endorse or promote products
              derived from this software without specific prior written permission.

        THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
        ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
        WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
        DISCLAIMED. IN NO EVENT SHALL SirEdeonX BE LIABLE FOR ANY
        DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
        (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
        LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
        ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
        (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
        SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

-- Addon description
_addon.name = 'XIV Hotbar'
_addon.author = 'Edeon'
_addon.version = '0.1'
_addon.language = 'english'

-- Libs
config = require('config')
file = require('files')
texts = require('texts')
images = require('images')
tables = require('tables')
resources = require('resources')
xml = require('libs/xml2')   -- TODO: REMOVE

-- User settings
local defaults = require('defaults')
local settings = config.load(defaults)
config.save(settings)

-- Load theme options according to settings
local theme = require('theme')
local theme_options = theme.apply(settings)

-- Addon Dependencies
local keyboard = require('keyboard_mapper')
local player = require('player')
local ui = require('ui')
local xivhotbar = require('variables')

-----------------------------
-- Main
-----------------------------

-- initialize addon
function initialize()
    local windower_player = windower.ffxi.get_player()
    local server = resources.servers[windower.ffxi.get_info().server].en

    if windower_player == nil then return end

    player:initialize(windower_player, server, theme_options)
    player:load_hotbar()
    ui:setup(theme_options)
    ui:load_player_hotbar(player.hotbar, player.vitals, player.hotbar_settings.active_environment)
    xivhotbar.ready = true
    xivhotbar.initialized = true
end

-- trigger hotbar action
function trigger_action(slot)
    player:execute_action(slot)
    ui:trigger_feedback(player.hotbar_settings.active_hotbar, slot)
end

-- toggle between field and battle hotbars
function toggle_environment()
    player:toggle_environment()

    ui:load_player_hotbar(player.hotbar, player.vitals, player.hotbar_settings.active_environment)
end

-- set battle environment
function set_battle_environment(in_battle)
    player:set_battle_environment(in_battle)
    ui:load_player_hotbar(player.hotbar, player.vitals, player.hotbar_settings.active_environment)
end

-- reload hotbar
function reload_hotbar()
    player:load_hotbar()
    ui:load_player_hotbar(player.hotbar, player.vitals, player.hotbar_settings.active_environment)
end

-- change active hotbar
function change_active_hotbar(new_hotbar)
    player:change_active_hotbar(new_hotbar)
end

-----------------------------
-- Bind Events
-----------------------------

-- ON LOAD
windower.register_event('load',function()
    if windower.ffxi.get_info().logged_in then
        initialize()
    end
end)

-- ON LOGIN
windower.register_event('login',function()
    initialize()
end)

-- ON LOGOUT
windower.register_event('logout', function()
    ui:hide()
end)

-- ON KEY
windower.register_event('keyboard', function(dik, flags, blocked)
    if xivhotbar.ready == false or windower.ffxi.get_info().chat_open then
        return
    end

    if xivhotbar.hide_hotbars then
        return
    end

    -- activate third hotbar
    if dik == keyboard.ctrl and flags == true and xivhotbar.pressing_combo_key_2 == false then
        xivhotbar.pressing_combo_key_2 = true
        change_active_hotbar(3)
    end

    if dik == keyboard.ctrl and flags == false and xivhotbar.pressing_combo_key_2 == true then
        xivhotbar.pressing_combo_key_2 = false
        change_active_hotbar(1)
    end

    -- activate second hotbar
    if dik == keyboard.shift and flags == true and xivhotbar.pressing_combo_key_1 == false then
        xivhotbar.pressing_combo_key_1 = true
        change_active_hotbar(2)
    end

    if dik == keyboard.shift and flags == false and xivhotbar.pressing_combo_key_1 == true then
        xivhotbar.pressing_combo_key_1 = false
        change_active_hotbar(1)
    end

    if dik == theme_options.controls_battle_mode and flags == true then
        toggle_environment()
    end

    if dik == keyboard.key_1 and flags == true then trigger_action(1) end
    if dik == keyboard.key_2 and flags == true then trigger_action(2) end
    if dik == keyboard.key_3 and flags == true then trigger_action(3) end
    if dik == keyboard.key_4 and flags == true then trigger_action(4) end
    if dik == keyboard.key_5 and flags == true then trigger_action(5) end
    if dik == keyboard.key_6 and flags == true then trigger_action(6) end
    if dik == keyboard.key_7 and flags == true then trigger_action(7) end
    if dik == keyboard.key_8 and flags == true then trigger_action(8) end
    if dik == keyboard.key_9 and flags == true then trigger_action(9) end
    if dik == keyboard.key_0 and flags == true then trigger_action(0) end
end)

-- ON PRERENDER
windower.register_event('prerender',function()
    if xivhotbar.ready == false then
        return
    end

    if ui.feedback.is_active then
        ui:show_feedback()
    end

    if ui.is_setup and xivhotbar.hide_hotbars == false then
        ui:check_recasts(player.hotbar, player.vitals, player.hotbar_settings.active_environment)
    end
end)

-- ON MP CHANGE
windower.register_event('mp change', function(new, old)
    player.vitals.mp = new
    ui:check_vitals(player.hotbar, player.vitals, player.hotbar_settings.active_environment)
end)

-- OM TP CHANGE
windower.register_event('tp change', function(new, old)
    player.vitals.tp = new
    ui:check_vitals(player.hotbar, player.vitals, player.hotbar_settings.active_environment)
end)

-- ON STATUS CHANGE
windower.register_event('status change', function(new_status_id)
    -- hide/show bar in cutscenes
    if xivhotbar.hide_hotbars == false and new_status_id == 4 then
        xivhotbar.hide_hotbars = true
        ui:hide()
    elseif xivhotbar.hide_hotbars and new_status_id ~= 4 then
        xivhotbar.hide_hotbars = false
        ui:show(player.hotbar, player.hotbar_settings.active_environment)
    end

    -- alternate environment on battle
    if xivhotbar.in_battle == false and (new_status_id == 1 or new_status_id == 3) then
        xivhotbar.in_battle = true
        set_battle_environment(true)
    elseif xivhotbar.in_battle and new_status_id ~= 1 and new_status_id ~= 3 then
        xivhotbar.in_battle = false
        set_battle_environment(false)
    end
end)

-- ON JOB CHANGE
windower.register_event('job change',function(main_job, main_job_level, sub_job, sub_job_level)
    player:update_jobs(resources.jobs[main_job].ens, resources.jobs[sub_job].ens)
    reload_hotbar()
end)