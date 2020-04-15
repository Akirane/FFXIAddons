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
_addon.author = 'Edeon, Maverickdfz'
_addon.version = '0.4'
_addon.language = 'english'
_addon.commands = {'xivhotbar', 'htb'}

-- Libs
config = require('config')
file = require('files')
texts = require('texts')
images = require('images')
tables = require('tables')
resources = require('resources')
xml = require('libs/xml2')   -- TODO: REMOVE

windower.register_event('load',function()
    windower.send_command('bind %1 htb execute 1 1;')-- 1
    windower.send_command('bind ~%1 htb execute 2 1;')-- Shift+1
    windower.send_command('bind ^%1 htb execute 3 1;')-- Ctrl+1
    windower.send_command('bind !%1 htb execute 4 1;')-- Alt+1

    windower.send_command('bind %2 htb execute 1 2;')-- 1
    windower.send_command('bind ~%2 htb execute 2 2;')-- Shift+1
    windower.send_command('bind ^%2 htb execute 3 2;')-- Ctrl+1
    windower.send_command('bind !%2 htb execute 4 2;')-- Alt+1

    windower.send_command('bind %3 htb execute 1 3;')-- 1
    windower.send_command('bind ~%3 htb execute 2 3;')-- Shift+1
    windower.send_command('bind ^%3 htb execute 3 3;')-- Ctrl+1
    windower.send_command('bind !%3 htb execute 4 3;')-- Alt+1

    windower.send_command('bind %4 htb execute 1 4;')-- 1
    windower.send_command('bind ~%4 htb execute 2 4;')-- Shift+1
    windower.send_command('bind ^%4 htb execute 3 4;')-- Ctrl+1
    windower.send_command('bind !%4 htb execute 4 4;')-- Alt+1

    windower.send_command('bind %5 htb execute 1 5;')-- 1
    windower.send_command('bind ~%5 htb execute 2 5;')-- Shift+1
    windower.send_command('bind ^%5 htb execute 3 5;')-- Ctrl+1
    windower.send_command('bind !%5 htb execute 4 5;')-- Alt+1

    windower.send_command('bind %6 htb execute 1 6;')-- 1
    windower.send_command('bind ~%6 htb execute 2 6;')-- Shift+1
    windower.send_command('bind ^%6 htb execute 3 6;')-- Ctrl+1
    windower.send_command('bind !%6 htb execute 4 6;')-- Alt+1

    windower.send_command('bind %7 htb execute 1 7;')-- 1
    windower.send_command('bind ~%7 htb execute 2 7;')-- Shift+1
    windower.send_command('bind ^%7 htb execute 3 7;')-- Ctrl+1
    windower.send_command('bind !%7 htb execute 4 7;')-- Alt+1

    windower.send_command('bind %8 htb execute 1 8;')-- 1
    windower.send_command('bind ~%8 htb execute 2 8;')-- Shift+1
    windower.send_command('bind ^%8 htb execute 3 8;')-- Ctrl+1
    windower.send_command('bind !%8 htb execute 4 8;')-- Alt+1

    windower.send_command('bind %9 htb execute 1 9;')-- 1
    windower.send_command('bind ~%9 htb execute 2 9;')-- Shift+1
    windower.send_command('bind ^%9 htb execute 3 9;')-- Ctrl+1
    windower.send_command('bind !%9 htb execute 4 9;')-- Alt+1

    windower.send_command('bind %0 htb execute 1 0;')-- 1
    windower.send_command('bind ~%0 htb execute 2 0;')-- Shift+1
    windower.send_command('bind ^%0 htb execute 3 0;')-- Ctrl+1
    windower.send_command('bind !%0 htb execute 4 0;')-- Alt+1
end)

windower.register_event('unload',function ()
    windower.send_command('unbind %1;')-- 1
    windower.send_command('unbind ~%1;')-- Shift+1
    windower.send_command('unbind ^%1;')-- Ctrl+1
    windower.send_command('unbind !%1;')-- Alt+1

    windower.send_command('unbind %2;')-- 1
    windower.send_command('unbind ~%2;')-- Shift+1
    windower.send_command('unbind ^%2;')-- Ctrl+1
    windower.send_command('unbind !%2;')-- Alt+1

    windower.send_command('unbind %3;')-- 1
    windower.send_command('unbind ~%3;')-- Shift+1
    windower.send_command('unbind ^%3;')-- Ctrl+1
    windower.send_command('unbind !%3;')-- Alt+1

    windower.send_command('unbind %4;')-- 1
    windower.send_command('unbind ~%4;')-- Shift+1
    windower.send_command('unbind ^%4;')-- Ctrl+1
    windower.send_command('unbind !%4;')-- Alt+1

    windower.send_command('unbind %5;')-- 1
    windower.send_command('unbind ~%5;')-- Shift+1
    windower.send_command('unbind ^%5;')-- Ctrl+1
    windower.send_command('unbind !%5;')-- Alt+1

    windower.send_command('unbind %6;')-- 1
    windower.send_command('unbind ~%6;')-- Shift+1
    windower.send_command('unbind ^%6;')-- Ctrl+1
    windower.send_command('unbind !%6;')-- Alt+1

    windower.send_command('unbind %7;')-- 1
    windower.send_command('unbind ~%7;')-- Shift+1
    windower.send_command('unbind ^%7;')-- Ctrl+1
    windower.send_command('unbind !%7;')-- Alt+1

    windower.send_command('unbind %8;')-- 1
    windower.send_command('unbind ~%8;')-- Shift+1
    windower.send_command('unbind ^%8;')-- Ctrl+1
    windower.send_command('unbind !%8;')-- Alt+1

    windower.send_command('unbind %9;')-- 1
    windower.send_command('unbind ~%9;')-- Shift+1
    windower.send_command('unbind ^%9;')-- Ctrl+1
    windower.send_command('unbind !%9;')-- Alt+1

    windower.send_command('unbind %0;')-- 1
    windower.send_command('unbind ~%0;')-- Shift+1
    windower.send_command('unbind ^%0;')-- Ctrl+1
    windower.send_command('unbind !%0;')-- Alt+1
end)

-- User settings
local defaults = require('defaults')
local settings = config.load(defaults)
config.save(settings)

-- Load theme options according to settings
local theme = require('theme')
local theme_options = theme.apply(settings)

-- Addon Dependencies
local action_manager = require('action_manager')
local keyboard = require('keyboard_mapper')
local player = require('player')
local ui = require('ui')
local xivhotbar = require('variables')

-----------------------------
-- Main
-----------------------------

local current_hotbar = -1
local current_action = -1

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
function set_environment(env)
    player:set_environment(env)

    ui:load_player_hotbar(player.hotbar, player.vitals, player.hotbar_settings.active_environment)
end

function toggle_environment()
    if player.hotbar_settings.active_environment == "field" then
        set_environment("battle")
    else
        set_environment("field")
    end
end

-- set battle environment
function set_battle_environment(in_battle)
    xivhotbar.in_battle = in_battle
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
-- Addon Commands
-----------------------------

-- command to set an action in a hotbar
function set_action_command(args)
    if not args[5] then
        print('XIVHOTBAR: Invalid arguments: set <mode> <hotbar> <slot> <action_type> <action> <target (optional)> <alias (optional)> <icon (optional)> <next_environment (optional)>')
        return
    end

    local environment = args[1]:lower()
    local hotbar = tonumber(args[2])
    local done = false
    if hotbar ~= nil then
        done = true
    end
    if not done then
        hotbar = args[2]
        done = #hotbar > 0
    end
    if not done then
        hotbar = 0
    end
    local slot = tonumber(args[3]) or 0
    local action_type = args[4]:lower()
    local action = args[5]
    local target = args[6] or nil
    local alias = args[7] or nil
    local icon = args[8] or nil
    local next_environment = args[9] or nil

    if hotbar < 1 or hotbar > 4 then
        print('XIVHOTBAR: Invalid hotbar. Please use a number between 1 and 4.')
        return
    end

    if slot < 1 or slot > 10 then
        print('XIVHOTBAR: Invalid slot. Please use a number between 1 and 10.')
        return
    end

    if target ~= nil then target = target:lower() end

    local new_action = action_manager:build(action_type, action, target, alias, icon, next_environment)
    player:add_action(new_action, environment, hotbar, slot)
    player:save_hotbar()
    reload_hotbar()
end

-- command to delete an action from an hotbar
function delete_action_command(args)
    if not args[3] then
        print('XIVHOTBAR: Invalid arguments: del <mode> <hotbar> <slot>')
        return
    end

    local environment = args[1]:lower()
    local hotbar = tonumber(args[2]) or 0
    local slot = tonumber(args[3]) or 0

    if hotbar < 1 or hotbar > 4 then
        print('XIVHOTBAR: Invalid hotbar. Please use a number between 1 and 4.')
        return
    end

    if slot < 1 or slot > 10 then
        print('XIVHOTBAR: Invalid slot. Please use a number between 1 and 10.')
        return
    end

    player:remove_action(environment, hotbar, slot)
    player:save_hotbar()
    reload_hotbar()
end

-- command to copy an action to another slot
function copy_action_command(args, is_moving)
    local command = 'copy'
    if is_moving then command = 'move' end

    if not args[6] then
        print('XIVHOTBAR: Invalid arguments: ' .. command .. ' <mode> <hotbar> <slot> <to_mode> <to_hotbar> <to_slot>')
        return
    end

    local environment = args[1]:lower()
    local hotbar = tonumber(args[2]) or 0
    local slot = tonumber(args[3]) or 0
    local to_environment = args[4]:lower()
    local to_hotbar =  tonumber(args[5]) or 0
    local to_slot =  tonumber(args[6]) or 0

    if hotbar < 1 or hotbar > 4 or to_hotbar < 1 or to_hotbar > 4 then
        print('XIVHOTBAR: Invalid hotbar. Please use a number between 1 and 4.')
        return
    end

    if slot < 1 or slot > 10 or to_slot < 1 or to_slot > 10 then
        print('XIVHOTBAR: Invalid slot. Please use a number between 1 and 10.')
        return
    end

    player:copy_action(environment, hotbar, slot, to_environment, to_hotbar, to_slot, is_moving)
    player:save_hotbar()
    reload_hotbar()
end

-- command to update action alias
function update_alias_command(args)
    if not args[4] then
        print('XIVHOTBAR: Invalid arguments: alias <mode> <hotbar> <slot> <alias>')
        return
    end

    local environment = args[1]:lower()
    local hotbar = tonumber(args[2]) or 0
    local slot = tonumber(args[3]) or 0
    local alias = args[4]

    if hotbar < 1 or hotbar > 4 then
        print('XIVHOTBAR: Invalid hotbar. Please use a number between 1 and 4.')
        return
    end

    if slot < 1 or slot > 10 then
        print('XIVHOTBAR: Invalid slot. Please use a number between 1 and 10.')
        return
    end

    player:set_action_alias(environment, hotbar, slot, alias)
    player:save_hotbar()
    reload_hotbar()
end

-- command to update action icon
function update_icon_command(args)
    if not args[4] then
        print('XIVHOTBAR: Invalid arguments: icon <mode> <hotbar> <slot> <icon>')
        return
    end

    local environment = args[1]:lower()
    local hotbar = tonumber(args[2]) or 0
    local slot = tonumber(args[3]) or 0
    local icon = args[4]

    if hotbar < 1 or hotbar > 4 then
        print('XIVHOTBAR: Invalid hotbar. Please use a number between 1 and 4.')
        return
    end

    if slot < 1 or slot > 10 then
        print('XIVHOTBAR: Invalid slot. Please use a number between 1 and 10.')
        return
    end

    player:set_action_icon(environment, hotbar, slot, icon)
    player:save_hotbar()
    reload_hotbar()
end

-- command to update action icon
function update_next_environment_command(args)
    if not args[4] then
        print('XIVHOTBAR: Invalid arguments: next_environment <mode> <hotbar> <slot> <next_environment>')
        return
    end

    local environment = args[1]:lower()
    local hotbar = tonumber(args[2]) or 0
    local slot = tonumber(args[3]) or 0
    local next_environment = args[4]

    if hotbar < 1 or hotbar > 4 then
        print('XIVHOTBAR: Invalid hotbar. Please use a number between 1 and 4.')
        return
    end

    if slot < 1 or slot > 10 then
        print('XIVHOTBAR: Invalid slot. Please use a number between 1 and 10.')
        return
    end

    player:set_action_next_environment(environment, hotbar, slot, next_environment)
    player:save_hotbar()
    reload_hotbar()
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

-- ON COMMAND
windower.register_event('addon command', function(command, ...)
    command = command and command:lower() or 'help'
    local args = {...}

    if command == 'reload' then
        return reload_hotbar()
    elseif command == 'autobattle' or command == 'ab' then
        if #args > 1 and args[1] == 'on' then
            theme_options.auto_battle_environment = true
        elseif #args > 1 and args[1] == 'off' then
            theme_options.auto_battle_environment = false
        else
            theme_options.auto_battle_environment = not theme_options.auto_battle_environment
        end
        settings.Hotbar.AutoBattleEnvironment = theme_options.auto_battle_environment
        config.save(settings)
    elseif command == 'execute' then
        local index = 1
        if #args > 3 then
            local env = args[index]
            set_environment(env)
            index = index + 1
        end
        local hb = tonumber(args[index])
        change_active_hotbar(hb)
        index = index + 1
        local action = tonumber(args[index])
        trigger_action(action)
    elseif command == 'environment' then
        set_environment(args[1])
    elseif command == 'set' then
        set_action_command(args)
    elseif command == 'del' or command == 'delete' then
        delete_action_command(args)
    elseif command == 'cp' or command == 'copy' then
        copy_action_command(args, false)
    elseif command == 'mv' or command == 'move' then
        copy_action_command(args, true)
    elseif command == 'ic' or command == 'icon' then
        update_icon_command(args)
    elseif command == 'al' or command == 'alias' then
        update_alias_command(args)
    elseif command == 'ne' or command == 'next_environment' then
        update_next_environment_command(args)
    end
end)

-- ON KEY
windower.register_event('keyboard', function(key, pressed, flags, blocked)
    if xivhotbar.ready == false or windower.ffxi.get_info().chat_open then
        return
    end

    if xivhotbar.hide_hotbars then
        return
    end

    if key == theme_options.controls_battle_mode and pressed == true then
        toggle_environment()
    end
end)

-- ON MOUSE
windower.register_event('mouse', function(type, x, y, delta, blocked)
    if blocked then
        return false
    end

    if xivhotbar.hide_hotbars then
        return false
    end

    if type == 1 then -- Mouse left click
        local hotbar, action = ui:hovered(x, y)
        if(action ~= 0) then
            current_hotbar = hotbar
            current_action = action
            return true
        end
    elseif type == 2 then -- Mouse left release
        if(current_action ~= -1) then
            local hotbar, action = ui:hovered(x, y)
            if(action ~= 0) then
                if(hotbar == current_hotbar and action == current_action) then
                    player.hotbar_settings.active_hotbar = hotbar
                    trigger_action(action % 10)
                end
            end
            current_hotbar = -1
            current_action = -1
            return true
        end
    elseif type == 0 then -- Mouse move
        if(current_action ~= -1) then
            return true
        end
    end

    return false
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

    if xivhotbar.auto_battle_environment then
        -- alternate environment on battle
        if xivhotbar.in_battle == false and (new_status_id == 1 or new_status_id == 3) then
            set_battle_environment(true)
        elseif xivhotbar.in_battle and new_status_id ~= 1 and new_status_id ~= 3 then
            set_battle_environment(false)
        end
    end
end)

-- ON JOB CHANGE
windower.register_event('job change',function(main_job, main_job_level, sub_job, sub_job_level)
    player:update_jobs(resources.jobs[main_job].ens, resources.jobs[sub_job].ens)
    reload_hotbar()
end)