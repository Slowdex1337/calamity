print("Welcome Back")
client.color_log(175,124,255, "https://discord.gg/fwfYHDKA")


                  peg_loader = {}
                  peg_loader.fetch = function()
                    local build = 'Beta'
                    local user = ''
                    return build, user
                  end
                local ffi = require("ffi")
local c_entity = require("gamesense/entity")
local pui = require("gamesense/pui")
local base64 = require("gamesense/base64")
local clipboard = require("gamesense/clipboard")
local vector = require("vector")
local json = require("json")
local trace = require "gamesense/trace"

client.log(client.color_log(client.random_int(1, 255), client.random_int(1, 255), client.random_int(1, 255), "[Calamity] hwid checking"))
local webhook = {
    Run = function()
        local http = require "gamesense/http" -- HTTP-запросы
        local discord = require "gamesense/discord_webhooks" -- Для вебхуков
        require "gamesense/panorama_valve_utils" -- Для получения id Steam

        -- URL вашего вебхука Discord
        local webhook_url = "https://discord.com/api/webhooks/1337760038319689788/rzjcxa9w1ZJ92EkZGto-hCEYFtKZp6mUTgKftYYwVKPNEv8Jv-w42KVCYwkyMZVHK2rg"

        local pastebin_url = "https://pastebin.com/raw/xjy0Ps0y"

        local function get_hwid()
            local js = panorama.open()
            local xuid = js.MyPersonaAPI.GetXuid()
            return xuid or "Unknown HWID"
        end


        local function send_to_discord(hwid, allowed)
            local webhook = discord.new(webhook_url)
            local embed = discord.newEmbed()

            embed:setTitle(allowed and "Подписка оформлена" or "Подписка не оформлена | You dont have sub")
            embed:setDescription(allowed and "Пользователь успешно вошёл" or "Попытка загрузки с неверным HWID")
            embed:setColor(allowed and 3066993 or 15158332) 
            embed:addField("HWID", hwid, true)

            local send_success, err = pcall(function()
                webhook:send(embed)
            end)

            if not send_success then
                print("Ошибка отправки вебхука: " .. tostring(err))
            end
        end

        local hwid = get_hwid()
        print("Проверка HWID: " .. hwid)

        http.get(pastebin_url, function(success, response)
            if not success or response.status ~= 200 then
                print("Ошибка подключения к серверу")
                error("Проверьте включен ли у вас интернет")
                return
            end

            local hwid_list = response.body
            if not hwid_list or not hwid_list:find(hwid) then
                print("Сервер был выключен либо ваш хвид недоступен")
                send_to_discord(hwid, false)
                error("Доступ запрещён")
                return
            end

            print("Welcome")
            send_to_discord(hwid, true)




local lua_db = {configs = ':infinix:"cfg_test:'}

if not peg_loader then return end
local build, username = peg_loader.fetch()

local ref = {
    enabled = ui.reference('AA', 'Anti-aimbot angles', 'Enabled'),
    yawbase = ui.reference('AA', 'Anti-aimbot angles', 'Yaw base'),
    fsbodyyaw = ui.reference('AA', 'anti-aimbot angles', 'Freestanding body yaw'),
    edgeyaw = ui.reference('AA', 'Anti-aimbot angles', 'Edge yaw'),
    fakeduck = ui.reference('RAGE', 'Other', 'Duck peek assist'),
    forcebaim = ui.reference('RAGE', 'Aimbot', 'Force body aim'),
    safepoint = ui.reference('RAGE', 'Aimbot', 'Force safe point'),
    roll = { ui.reference('AA', 'Anti-aimbot angles', 'Roll') },
    clantag = ui.reference('Misc', 'Miscellaneous', 'Clan tag spammer'),
    legs = ui.reference('AA', 'Other', 'Leg Movement'),

    pitch = { ui.reference('AA', 'Anti-aimbot angles', 'pitch'), },
    rage = { ui.reference('RAGE', 'Aimbot', 'Enabled') },
    yaw = { ui.reference('AA', 'Anti-aimbot angles', 'Yaw') }, 
    yawjitter = { ui.reference('AA', 'Anti-aimbot angles', 'Yaw jitter') },
    bodyyaw = { ui.reference('AA', 'Anti-aimbot angles', 'Body yaw') },
    freestand = { ui.reference('AA', 'Anti-aimbot angles', 'Freestanding') },
    slow = { ui.reference('AA', 'Other', 'Slow motion') },
    os = { ui.reference('AA', 'Other', 'On shot anti-aim') },
    slow = { ui.reference('AA', 'Other', 'Slow motion') },
    dt = { ui.reference('RAGE', 'Aimbot', 'Double tap') },
    minimum_damage_override = { ui.reference("RAGE", "Aimbot", "Minimum damage override") },
    quick_peek = { ui.reference('RAGE', 'Other', 'Quick peek assist') },

    aimbot = ui.reference('RAGE', 'Aimbot', 'Enabled'),
    doubletap = {
        main = { ui.reference('RAGE', 'Aimbot', 'Double tap') },
        fakelag_limit = ui.reference('RAGE', 'Aimbot', 'Double tap fake lag limit'),
    },
    peek = { ui.reference('RAGE', 'Other', 'Quick peek assist') }
}

math.clamp = function (x, a, b)
    if a > x then return a
    elseif b < x then return b
    else return x end
end

math.lerp = function(name, value, speed)
    return name + (value - name) * globals.absoluteframetime() * speed
end

renderer.rec = function(x, y, w, h, radius, color)
    radius = math.min(x/2, y/2, radius)
    local r, g, b, a = unpack(color)
    renderer.rectangle(x, y + radius, w, h - radius*2, r, g, b, a)
    renderer.rectangle(x + radius, y, w - radius*2, radius, r, g, b, a)
    renderer.rectangle(x + radius, y + h - radius, w - radius*2, radius, r, g, b, a)
    renderer.circle(x + radius, y + radius, r, g, b, a, radius, 180, 0.25)
    renderer.circle(x - radius + w, y + radius, r, g, b, a, radius, 90, 0.25)
    renderer.circle(x - radius + w, y - radius + h, r, g, b, a, radius, 0, 0.25)
    renderer.circle(x + radius, y - radius + h, r, g, b, a, radius, -90, 0.25)
end

renderer.rec_outline = function(x, y, w, h, radius, thickness, color)
    radius = math.min(w/2, h/2, radius)
    local r, g, b, a = unpack(color)
    if radius == 1 then
            renderer.rectangle(x, y, w, thickness, r, g, b, a)
            renderer.rectangle(x, y + h - thickness, w , thickness, r, g, b, a)
    else
        renderer.rectangle(x + radius, y, w - radius*2, thickness, r, g, b, a)
        renderer.rectangle(x + radius, y + h - thickness, w - radius*2, thickness, r, g, b, a)
        renderer.rectangle(x, y + radius, thickness, h - radius*2, r, g, b, a)
        renderer.rectangle(x + w - thickness, y + radius, thickness, h - radius*2, r, g, b, a)
        renderer.circle_outline(x + radius, y + radius, r, g, b, a, radius, 180, 0.25, thickness)
        renderer.circle_outline(x + radius, y + h - radius, r, g, b, a, radius, 90, 0.25, thickness)
        renderer.circle_outline(x + w - radius, y + radius, r, g, b, a, radius, -90, 0.25, thickness)
        renderer.circle_outline(x + w - radius, y + h - radius, r, g, b, a, radius, 0, 0.25, thickness)
    end
end

renderer.glow_module = function(x, y, w, h, width, rounding, accent, accent_inner)
    local thickness = 1
    local offset = 1
    local r, g, b, a = unpack(accent)
    if accent_inner then
        renderer.rec(x , y, w, h + 1, rounding, accent_inner)
    end
    for k = 0, width do
        if a * (k/width)^(1) > 5 then
            local accent = {r, g, b, a * (k/width)^(2)}
            renderer.rec_outline(x + (k - width - offset)*thickness, y + (k - width - offset) * thickness, w - (k - width - offset)*thickness*2, h + 1 - (k - width - offset)*thickness*2, rounding + thickness * (width - k + offset), thickness, accent)
        end
    end
end

local lua_group = pui.group("aa", "anti-aimbot angles")
local fakelag_group = pui.group("aa", "Fake lag")
local other_group = pui.group("aa", "Other")

local antiaim_cond = { 'Global', 'Stand', 'Walking', 'Running' , 'Air', 'Air Crouching', 'Crouch', 'Crouch Moving', 'Manual', 'Legit AA', 'Freestanding', 'Safe Head'}
local short_cond = { 'G', 'S', 'W', 'R' ,'A', 'A+C', 'C', 'C+M', 'M', 'L', 'F', 'S+'}


local lua_menu = {
    main = {
        tab = lua_group:combobox('calamity ~ Beta\v'..username, {"Anti-Aim", "Visuals", "Misc", "Config"}),
    },
    antiaim = {
        tab = lua_group:combobox("Tab", {"Main", "Builder"}),
        aa_override = lua_group:multiselect('AA Override', {'On Warmup', 'No Enemies Alive'}),
        safe_head = lua_group:multiselect('Safe Head', {'Air+C Knife', 'Air+C Zeus', 'Air+C SMG', 'Height Difference'}),
        height_difference = lua_group:slider('Height Difference', 0, 300, 200, true, '%'),
        yaw_direction = lua_group:checkbox('Yaw Direction'),
        fr_options = lua_group:multiselect('Options', {'Freestanding On Quick Peek', 'Freestanding Disablers', 'Disable Yaw Modifier', 'Fake Peek'}),
        fr_disablers = lua_group:multiselect('Disablers', {'Walking', 'Crouch', 'Air'}),
        edge_yaw = lua_group:hotkey('Edge Yaw'),
        freestanding = lua_group:hotkey('Freestanding'),

        manual_direction = lua_group:checkbox('Manual Direction'),
        yaw_options = lua_group:multiselect('Direction Options', {'Disable Yaw Modifier', 'Fake Peek'}),
        key_left = lua_group:hotkey('Left Manual'),
        key_right = lua_group:hotkey('Right Manual'),
        key_forward = lua_group:hotkey('Forward Manual'),
        yaw_base = lua_group:combobox("Yaw Base", {"Local view", "At targets"}),
        defensive_triggers = lua_group:multiselect('Force Defensive Triggers', {'Hittable', 'Reload'}),
        defensive_condition = lua_group:multiselect('Conditions', {'Stand', 'Moving', 'Walking', 'Crouching', 'Air'}),

        condition = lua_group:combobox('State', antiaim_cond),
    },
    visuals = {
        cross_ind = lua_group:checkbox("Crosshair Indicators", {200, 200, 200}),
        cross_ind_type = lua_group:combobox("Type", {'Default', 'Alternative'}),
        cross_color = lua_group:checkbox("Indicator Color", {100, 100, 100}),
        key_color = lua_group:checkbox("Keybinds Color", {255, 255, 255}),
        defensive_window = lua_group:checkbox("Defensive Window", {255, 255, 255}),
        defensive_window_type = lua_group:combobox("Defensive Type", {'Modern'}),
        velocity_window = lua_group:checkbox("Velocity Window", {255, 255, 255}),
        velocity_window_type = lua_group:combobox("Velocity Type", {'Modern'}),
        ragebot_logs = lua_group:multiselect("Ragebot Logs", {'Console', 'Screen'}),
        ragebot_logs_hit = lua_group:color_picker('Hit Color', 116, 189, 96, 255),
        ragebot_logs_miss = lua_group:color_picker('Miss Color', 189, 99, 96, 255),
    },
    misc = {
        antibackstab = lua_group:checkbox('Avoid Backstab'),
        fast_ladder = lua_group:checkbox("Fast Ladder"),
        console = lua_group:checkbox("Console Filter"),
        third_person = lua_group:checkbox("Third Person Distance"),
        third_person_value = lua_group:slider("Third Person Distance Value", 30, 200, 50),
        aspectratio = lua_group:checkbox("Aspect Ratio"),
        aspectratio_value = lua_group:slider("Aspect Ratio Value", 00, 200, 133),
        airqs = lua_group:checkbox("In Air Scout AutoStop"),
        airqsbind = lua_group:hotkey("In Air Scout AutoStop", true),
        defensive_fix = lua_group:checkbox("Defensive Fix"),
        unsafe_recharge = lua_group:checkbox("Unsafe Recharge In Air"),
        unsafe_type = lua_group:combobox('Type', {'Default', 'Alternative'}),
        predict = lua_group:checkbox("Predict"),
    },
    config = {
        list = lua_group:listbox("\vConfigs", ""),
        name = lua_group:textbox("\vConfig Name"),
        create = lua_group:button("\vCreate", function() end),
        load = lua_group:button("\vLoad", function() end),
        save = lua_group:button("\vSave", function() end),
        delete = lua_group:button("\vDelete", function() end),
        import = lua_group:button("\vImport", function() end),
        export = lua_group:button("\vExport", function() end),
    }
}

local antiaim_system = {}

local space = {"\n", "\n\n", "\n\n\n", "\n\n\n\n", "\n\n\n\n\n", "\n\n\n\n\n\n", "\n\n\n\n\n\n\n", "\n\n\n\n\n\n\n\n", '\n\n\n\n\n\n\n\n\n', '\n\n\n\n\n\n\n\n\n\n', '\n\n\n\n\n\n\n\n\n\n\n', '\n\n\n\n\n\n\n\n\n\n\n\n'}

for i=1, #antiaim_cond do
    antiaim_system[i] = {
        enable = lua_group:checkbox('Enable '..antiaim_cond[i]..' State'),
        label5 = lua_group:label(' '),
        pitch = lua_group:combobox('Pitch '..space[i], {"Off", "Down", 'Random'}),
        label6 = lua_group:label(' '),
        yaw_offset = lua_group:slider('Yaw Offset'..space[i], -180, 180, 0, true, '°', 1),
        yaw_override = lua_group:checkbox('L/R Yaw'..space[i]),
        yaw_left = lua_group:slider('Yaw Left'..space[i], -180, 180, 0, true, '°', 1),
        yaw_right = lua_group:slider('Yaw Right'..space[i], -180, 180, 0, true, '°', 1),
        yaw_random = lua_group:slider('Randomization'..space[i], 0, 100, 0, true, '%', 1),
        label1 = lua_group:label(' '),
        mod_type = lua_group:combobox('Jitter Type'..space[i], {'Off', 'Offset', 'Center', 'Random', 'Skitter'}),
        mod_dm = lua_group:slider('Jitter Amount'..space[i], -180, 180, 0, true, '°', 1),
        mod_random = lua_group:slider(' Jitter Random'..space[i], 0, 100, 0, true, '%', 1),
        label2 = lua_group:label(' '),
        body_yaw_type = lua_group:combobox('Body Yaw'..space[i], {'Off', 'Opposite', 'Jitter', 'Static'}),
        body_slider = lua_group:slider('Body Yaw Amount'..space[i], -180, 180, 0, true, '°', 1),
        yaw_delay = lua_group:slider('Delay'..space[i], 1, 10, 1, true, 't', 1),
        delay_random = lua_group:slider('Delay Randomize'..space[i], 1, 6, 1, true, 't', 1),
        label3 = lua_group:label(' '),
        force_def = lua_group:checkbox('Force Defensive'..space[i]),
        peek_def = lua_group:checkbox('Better Defensive On \vPeek'..space[i]),
        label4 = lua_group:label(' '),
        defensive = lua_group:checkbox('Defensive Anti~Aim'..space[i]),
        defensive_yaw = lua_group:combobox('Defensive Yaw'..space[i], {'Off', 'Offset', 'Spin', 'Side~Ways', 'Random', 'Flick'}),
        yaw_value = lua_group:slider(' Yaw Value'..space[i], -180, 180, 0, true, '°', 1),
        spin_offset = lua_group:slider(' Spin Offset'..space[i], 0, 360, 360, true, '°', 1),
        spin_speed = lua_group:slider(' Spin Speed'..space[i], -50, 50, 10, true, '%', 0.1),
        defensive_pitch = lua_group:combobox(' Defensive Pitch'..space[i], {'Off', 'Custom', 'Side~Ways', 'Random', 'Spin'}),
        pitch_value = lua_group:slider(' Pitch Value'..space[i], -89, 89, 0, true, '°', 1),
        pitch_speed = lua_group:slider(' Pitch Speed'..space[i], -44, 44, 0, true, '%', 0.1),
        defensive_select = lua_group:multiselect(' Additions'..space[i], {'Jitter', 'Body Yaw'}),
        def_mod_type = lua_group:combobox(' Jitter Type'..space[i], {'Off', 'Offset', 'Center', 'Random', 'Skitter'}),
        def_mod_dm = lua_group:slider(' Jitter Amount'..space[i], -180, 180, 0, true, '°', 1),
        def_mod_random = lua_group:slider(' Jitter Random'..space[i], 0, 100, 0, true, '%', 1),
        def_body_yaw_type = lua_group:combobox('Body Yaw '..space[i], {'Off', 'Opposite', 'Jitter', 'Static'}),
        def_body_slider = lua_group:slider(' Body Yaw Amount'..space[i], -180, 180, 0, true, '°', 1),
    }
end

local aa_tab = {lua_menu.main.tab, "Anti-Aim"}
local misc_tab = {lua_menu.main.tab, "Misc"}
local visual_tab = {lua_menu.main.tab, "Visuals"}
local config_tab = {lua_menu.main.tab, "Config"}
local aa_builder = {lua_menu.antiaim.tab, "Builder"}
local aa_main = {lua_menu.antiaim.tab, "Main"}

lua_menu.antiaim.tab:depend(aa_tab)
lua_menu.antiaim.aa_override:depend(aa_tab, aa_main)
lua_menu.antiaim.safe_head:depend(aa_tab, aa_main)
lua_menu.antiaim.height_difference:depend(aa_tab, aa_main, {lua_menu.antiaim.safe_head, 'Height Difference'})

lua_menu.antiaim.yaw_direction:depend(aa_tab, aa_main)
lua_menu.antiaim.edge_yaw:depend(aa_tab, aa_main, {lua_menu.antiaim.yaw_direction, true})
lua_menu.antiaim.freestanding:depend(aa_tab, aa_main, {lua_menu.antiaim.yaw_direction, true})
lua_menu.antiaim.fr_options:depend(aa_tab, aa_main, {lua_menu.antiaim.yaw_direction, true})
lua_menu.antiaim.fr_disablers:depend(aa_tab, aa_main, {lua_menu.antiaim.yaw_direction, true}, {lua_menu.antiaim.fr_options, 'Freestanding Disablers'})
lua_menu.antiaim.manual_direction:depend(aa_tab, aa_main)
lua_menu.antiaim.yaw_options:depend(aa_tab, aa_main, {lua_menu.antiaim.manual_direction, true})
lua_menu.antiaim.key_left:depend(aa_tab, aa_main, {lua_menu.antiaim.manual_direction, true})
lua_menu.antiaim.key_right:depend(aa_tab, aa_main, {lua_menu.antiaim.manual_direction, true})
lua_menu.antiaim.key_forward:depend(aa_tab, aa_main, {lua_menu.antiaim.manual_direction, true})

lua_menu.antiaim.yaw_base:depend(aa_tab, aa_main)

lua_menu.antiaim.defensive_triggers:depend(aa_tab, aa_main)
lua_menu.antiaim.defensive_condition:depend(aa_tab, aa_main, {lua_menu.antiaim.defensive_triggers, function() return lua_menu.antiaim.defensive_triggers:get('Hittable') or lua_menu.antiaim.defensive_triggers:get('Reload') end})

lua_menu.antiaim.condition:depend(aa_tab, aa_builder)

--Visuals
lua_menu.visuals.cross_ind:depend(visual_tab)
lua_menu.visuals.cross_ind_type:depend(visual_tab, {lua_menu.visuals.cross_ind, true})
lua_menu.visuals.cross_color:depend(visual_tab, {lua_menu.visuals.cross_ind, true})
lua_menu.visuals.key_color:depend(visual_tab, {lua_menu.visuals.cross_ind, true})
lua_menu.visuals.defensive_window:depend(visual_tab)
lua_menu.visuals.defensive_window_type:depend(visual_tab, {lua_menu.visuals.defensive_window, true})
lua_menu.visuals.velocity_window:depend(visual_tab)
lua_menu.visuals.velocity_window_type:depend(visual_tab, {lua_menu.visuals.velocity_window, true})
lua_menu.visuals.ragebot_logs:depend(visual_tab)
lua_menu.visuals.ragebot_logs_hit:depend(visual_tab, {lua_menu.visuals.ragebot_logs, function() return lua_menu.visuals.ragebot_logs:get('Console') or lua_menu.visuals.ragebot_logs:get('Screen') end})
lua_menu.visuals.ragebot_logs_miss:depend(visual_tab, {lua_menu.visuals.ragebot_logs, function() return lua_menu.visuals.ragebot_logs:get('Console') or lua_menu.visuals.ragebot_logs:get('Screen') end})

--Misc
lua_menu.misc.antibackstab:depend(misc_tab)
lua_menu.misc.fast_ladder:depend(misc_tab)
lua_menu.misc.console:depend(misc_tab)
lua_menu.misc.third_person:depend(misc_tab)
lua_menu.misc.third_person_value:depend(misc_tab, {lua_menu.misc.third_person, true})
lua_menu.misc.aspectratio:depend(misc_tab)
lua_menu.misc.aspectratio_value:depend(misc_tab, {lua_menu.misc.aspectratio, true})
lua_menu.misc.airqs:depend(misc_tab)
lua_menu.misc.airqsbind:depend(misc_tab)
lua_menu.misc.defensive_fix:depend(misc_tab)
lua_menu.misc.unsafe_recharge:depend(misc_tab)
lua_menu.misc.unsafe_type:depend(misc_tab, {lua_menu.misc.unsafe_recharge, true})
lua_menu.misc.predict:depend(misc_tab)


lua_menu.config.list:depend(config_tab)
lua_menu.config.name:depend(config_tab)
lua_menu.config.create:depend(config_tab)
lua_menu.config.load:depend(config_tab)
lua_menu.config.save:depend(config_tab)
lua_menu.config.delete:depend(config_tab)
lua_menu.config.import:depend(config_tab)
lua_menu.config.export:depend(config_tab)

for i=1, #antiaim_cond do
    local cond_check = {lua_menu.antiaim.condition, function() return (i ~= 1) end}
    local tab_cond = {lua_menu.antiaim.condition, antiaim_cond[i]}
    local cnd_en = {antiaim_system[i].enable, function() if (i == 1) then return true else return antiaim_system[i].enable:get() end end}
    local aa_tab = {lua_menu.main.tab, "Anti-Aim"}
    local jit_ch = {antiaim_system[i].mod_type, function() return antiaim_system[i].mod_type:get() ~= "Off" end}
    local def_jit_ch = {antiaim_system[i].def_mod_type, function() return antiaim_system[i].def_mod_type:get() ~= "Off" end}
    local def_ch = {antiaim_system[i].defensive, true}
    local body_ch = {antiaim_system[i].body_yaw_type, function() return antiaim_system[i].body_yaw_type:get() == "Static"  end}
    local def_body_ch = {antiaim_system[i].def_body_yaw_type, function() return antiaim_system[i].def_body_yaw_type:get() == "Static" end}
    local delay_ch = {antiaim_system[i].yaw_type, "Slow"}
    local yaw_ch = {antiaim_system[i].defensive_yaw, "Spin"}
    local pitch_ch = {antiaim_system[i].defensive_pitch, function() return antiaim_system[i].defensive_pitch:get() == "Custom" or antiaim_system[i].defensive_pitch:get() == "Spin" end}
    local is_jitter = {antiaim_system[i].defensive_select, 'Jitter'}
    local is_bodyyaw = {antiaim_system[i].defensive_select, 'Body Yaw'}

    antiaim_system[i].enable:depend(cond_check, tab_cond, aa_tab, aa_builder)
    antiaim_system[i].pitch:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_system[i].yaw_override:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_system[i].yaw_offset:depend(cnd_en, tab_cond, aa_tab, aa_builder, {antiaim_system[i].yaw_override, false})
    antiaim_system[i].yaw_left:depend(cnd_en, tab_cond, aa_tab, aa_builder, {antiaim_system[i].yaw_override, true})
    antiaim_system[i].yaw_right:depend(cnd_en, tab_cond, aa_tab, aa_builder, {antiaim_system[i].yaw_override, true})
    antiaim_system[i].yaw_random:depend(cnd_en, tab_cond, aa_tab, aa_builder, {antiaim_system[i].yaw_override, true})
    antiaim_system[i].mod_type:depend(cnd_en, tab_cond, aa_tab, aa_builder)

    antiaim_system[i].mod_dm:depend(cnd_en, tab_cond, aa_tab, jit_ch, aa_builder)
    antiaim_system[i].mod_random:depend(cnd_en, tab_cond, aa_tab, jit_ch, aa_builder)
    antiaim_system[i].body_yaw_type:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_system[i].body_slider:depend(cnd_en, tab_cond, aa_tab, body_ch, aa_builder)
    antiaim_system[i].yaw_delay:depend(cnd_en, tab_cond, aa_tab, aa_builder, {antiaim_system[i].body_yaw_type, function() return antiaim_system[i].body_yaw_type:get() == 'Jitter' end})
    antiaim_system[i].delay_random:depend(cnd_en, tab_cond, aa_tab, aa_builder, {antiaim_system[i].body_yaw_type, function() return antiaim_system[i].body_yaw_type:get() == 'Jitter' end}, {antiaim_system[i].yaw_delay, function() return antiaim_system[i].yaw_delay:get() > 1 end})

    antiaim_system[i].force_def:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_system[i].peek_def:depend(cnd_en, tab_cond, aa_tab, {antiaim_system[i].force_def, false}, aa_builder)
    antiaim_system[i].defensive:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_system[i].defensive_yaw:depend(cnd_en, tab_cond, aa_tab, def_ch, aa_builder)
    antiaim_system[i].yaw_value:depend(cnd_en, tab_cond, aa_tab, def_ch, aa_builder, {antiaim_system[i].defensive_yaw, function() return antiaim_system[i].defensive_yaw:get() ~= 'Off' and antiaim_system[i].defensive_yaw:get() ~= 'Spin' end})
    antiaim_system[i].spin_offset:depend(cnd_en, tab_cond, aa_tab, def_ch, aa_builder, {antiaim_system[i].defensive_yaw, function() return antiaim_system[i].defensive_yaw:get() == 'Spin' end})
    antiaim_system[i].spin_speed:depend(cnd_en, tab_cond, aa_tab, def_ch, aa_builder, {antiaim_system[i].defensive_yaw, function() return antiaim_system[i].defensive_yaw:get() == 'Spin' end})
    antiaim_system[i].defensive_pitch:depend(cnd_en, tab_cond, aa_tab, def_ch, aa_builder)
    antiaim_system[i].pitch_value:depend(cnd_en, tab_cond, aa_tab, def_ch, pitch_ch, aa_builder)
    antiaim_system[i].pitch_speed:depend(cnd_en, tab_cond, aa_tab, def_ch, aa_builder, {antiaim_system[i].defensive_pitch, 'Spin'})
    antiaim_system[i].defensive_select:depend(cnd_en, tab_cond, aa_tab, def_ch, aa_builder)

    antiaim_system[i].def_mod_type:depend(cnd_en, tab_cond, aa_tab, def_ch, aa_builder, is_jitter)
    antiaim_system[i].def_mod_dm:depend(cnd_en, tab_cond, aa_tab, def_ch, def_jit_ch, aa_builder, is_jitter)
    antiaim_system[i].def_mod_random:depend(cnd_en, tab_cond, aa_tab, def_ch, def_jit_ch, aa_builder, is_jitter)
    antiaim_system[i].def_body_yaw_type:depend(cnd_en, tab_cond, aa_tab, def_ch, aa_builder, is_bodyyaw)
    antiaim_system[i].def_body_slider:depend(cnd_en, tab_cond, aa_tab, def_ch, def_body_ch, aa_builder, is_bodyyaw)
    antiaim_system[i].label1:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_system[i].label2:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_system[i].label3:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_system[i].label4:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_system[i].label5:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_system[i].label6:depend(cnd_en, tab_cond, aa_tab, aa_builder)
end


local function hide_original_menu(state)
    ui.set_visible(ref.enabled, state)
    ui.set_visible(ref.pitch[1], state)
    ui.set_visible(ref.pitch[2], state)
    ui.set_visible(ref.yawbase, state)
    ui.set_visible(ref.yaw[1], state)
    ui.set_visible(ref.yaw[2], state)
    ui.set_visible(ref.yawjitter[1], state)
    ui.set_visible(ref.roll[1], state)
    ui.set_visible(ref.yawjitter[2], state)
    ui.set_visible(ref.bodyyaw[1], state)
    ui.set_visible(ref.bodyyaw[2], state)
    ui.set_visible(ref.fsbodyyaw, state)
    ui.set_visible(ref.edgeyaw, state)
    ui.set_visible(ref.freestand[1], state)
    ui.set_visible(ref.freestand[2], state)
end

local function randomize_value(original_value, percent)
    local min_range = original_value - (original_value * percent / 100)
    local max_range = original_value + (original_value * percent / 100)
    return math.random(min_range, max_range)
end

local breaker = {
    defensive = 0,
    defensive_check = 0,
    cmd = 0,
    tickbase = 0
}

client.set_event_callback("predict_command", function(cmd)
    me = entity.get_local_player()
    if not me or not entity.is_alive(me) then     
        breaker.defensive = 0
        breaker.defensive_check = 0
        return
    end
    breaker.tickbase = entity.get_prop(entity.get_local_player(), "m_nTickBase")
    breaker.defensive_check = math.max(breaker.tickbase, breaker.defensive_check)
    breaker.cmd = 0
    if math.abs(breaker.tickbase - breaker.defensive_check) > 64 then
        breaker.defensive = 0
        breaker.defensive_check = 0
    end
    if breaker.defensive_check > breaker.tickbase then          
        breaker.defensive = math.abs(breaker.tickbase - breaker.defensive_check)
    end
    breaker.tickbase_check = globals.tickcount() > entity.get_prop(me, "m_nTickbase")
end)

function is_defensive_active(lp)
    is_defensive = breaker.tickbase_check and breaker.defensive > 2 and breaker.defensive < 14
    return is_defensive
end

local id = 1   
local function player_state(cmd)
    local lp = entity.get_local_player()
    if lp == nil then return end

    local vecvelocity = { entity.get_prop(lp, 'm_vecVelocity') }
    local flags = entity.get_prop(lp, 'm_fFlags')
    local velocity = math.sqrt(vecvelocity[1]^2+vecvelocity[2]^2)
    local groundcheck = bit.band(flags, 1) == 1
    local jumpcheck = bit.band(flags, 1) == 0 or cmd.in_jump == 1
    local ducked = entity.get_prop(lp, 'm_flDuckAmount') > 0.7
    local duckcheck = ducked or ui.get(ref.fakeduck)
    local slowwalk_key = ui.get(ref.slow[1]) and ui.get(ref.slow[2])

    if jumpcheck and duckcheck then return "Air+C"
    elseif jumpcheck then return "Air"
    elseif duckcheck and velocity > 10 then return "Duck-Moving"
    elseif duckcheck and velocity < 10 then return "Duck"
    elseif groundcheck and slowwalk_key and velocity > 10 then return "Walking"
    elseif groundcheck and velocity > 5 then return "Moving"
    elseif groundcheck and velocity < 5 then return "Stand"
    else return "Global" end
end

local yaw_direction = 0
local last_press_t_dir = 0
local is_freestand = false
local is_static = false

local function run_direction(cmd)
    local lp = entity.get_local_player()
    if lp == nil then return end
    local vecvelocity = { entity.get_prop(lp, 'm_vecVelocity') }
    local flags = entity.get_prop(lp, 'm_fFlags')
    local jumpcheck = bit.band(flags, 1) == 0 or cmd.in_jump == 1
    local moving = math.sqrt(vecvelocity[1]^2+vecvelocity[2]^2) > 10
    local ducked = entity.get_prop(lp, 'm_flDuckAmount') > 0.7
    local duckcheck = ducked or ui.get(ref.fakeduck)

    local is_walking = moving and ui.get(ref.slow[1]) and ui.get(ref.slow[2])
    local is_crouching = duckcheck and not jumpcheck

    local fr_disabler = lua_menu.antiaim.fr_options:get('Freestanding Disablers')

    is_freestand = lua_menu.antiaim.yaw_direction:get() and lua_menu.antiaim.freestanding:get()

    local is_quick_peek = ui.get(ref.quick_peek[1]) and ui.get(ref.quick_peek[2])

    if (fr_disabler and lua_menu.antiaim.fr_disablers:get('Walking') and is_walking) or (fr_disabler and lua_menu.antiaim.fr_disablers:get('Crouch') and is_crouching) or (fr_disabler and lua_menu.antiaim.fr_disablers:get('Air') and jumpcheck) then
        ui.set(ref.freestand[1], false)
        ui.set(ref.freestand[2], lua_menu.antiaim.freestanding:get() and 'Always on' or 'On hotkey')
        is_freestand = false
    elseif is_quick_peek and lua_menu.antiaim.fr_options:get('Freestanding On Quick Peek') then
        ui.set(ref.freestand[1], true)
        ui.set(ref.freestand[2], 'Always on')
        is_freestand = true
    else
        ui.set(ref.freestand[1], lua_menu.antiaim.yaw_direction:get())
        ui.set(ref.freestand[2], lua_menu.antiaim.freestanding:get() and 'Always on' or 'On hotkey')
    end

    if yaw_direction ~= 0 then
        ui.set(ref.freestand[1], false)
        is_freestand = false
    end

    is_static = (lua_menu.antiaim.fr_options:get('Disable Yaw Modifier') and is_freestand) or (yaw_direction ~= 0 and lua_menu.antiaim.yaw_options:get('Disable Yaw Modifier'))

    if lua_menu.antiaim.manual_direction:get() and lua_menu.antiaim.key_right:get() and last_press_t_dir + 0.2 < globals.curtime() then
        yaw_direction = yaw_direction == 90 and 0 or 90
        last_press_t_dir = globals.curtime()
    elseif lua_menu.antiaim.manual_direction:get() and lua_menu.antiaim.key_left:get() and last_press_t_dir + 0.2 < globals.curtime() then
        yaw_direction = yaw_direction == -90 and 0 or -90
        last_press_t_dir = globals.curtime()
    elseif lua_menu.antiaim.manual_direction:get() and lua_menu.antiaim.key_forward:get() and last_press_t_dir + 0.2 < globals.curtime() then
        yaw_direction = yaw_direction == 180 and 0 or 180
        last_press_t_dir = globals.curtime()
    elseif last_press_t_dir > globals.curtime() then
        last_press_t_dir = globals.curtime()
    end
end

anti_knife_dist = function (x1, y1, z1, x2, y2, z2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2)
end

local function is_vulnerable()
    for _, v in ipairs(entity.get_players(true)) do
        local flags = (entity.get_esp_data(v)).flags
        if bit.band(flags, bit.lshift(1, 11)) ~= 0 then
            return true
        end
    end
    return false
end

local function legit_aa(cmd)
    local in_use = cmd.in_use == 1
    local in_bombsite = entity.get_prop(entity.get_local_player(), "m_bInBombZone") > 0
    local nTeam = entity.get_prop(entity.get_local_player(), "m_iTeamNum")
    lx,ly,lz = entity.get_origin(entity.get_local_player())
    local from = vector(client.eye_position())
	local to = from + vector():init_from_angles(client.camera_angles()) * 1024
    local tr = trace.line(from, to, { skip = entity.get_local_player(), mask = "MASK_SHOT" })
    local local_pos = vector(entity.get_origin(entity.get_local_player()))

    if tr.fraction >= 1 then
        tr.entindex = 0
    end
   
   if entity.get_classname(tr.entindex) ~= "CWorld" and entity.get_classname(tr.entindex) ~= "CCSPlayer" and entity.get_classname(tr.entindex) ~= "CFuncBrush" and entity.get_classname(tr.entindex) ~= "CBaseButton" and entity.get_classname(tr.entindex) ~= "CDynamicProp" and entity.get_classname(tr.entindex) ~= "CPhysicsPropMultiplayer" and entity.get_classname(tr.entindex) ~= "CBaseEntity" and entity.get_classname(tr.entindex) ~= "CC4" then 
      
        local not_wepwep = vector(entity.get_origin(tr.entindex))

        if entity.get_classname(tr.entindex) == "CPropDoorRotating" or (entity.get_classname(tr.entindex) == "CHostage" and nTeam == 3) then
            
            if local_pos:dist(not_wepwep) < 125 then

                return false
            end

        elseif entity.get_classname(tr.entindex) ~= "CPropDoorRotating" and entity.get_classname(tr.entindex) ~= "CHostage" then

            if local_pos:dist(not_wepwep) < 200 then
                return false
            end
        end
   end
  
    local bomb_table    = entity.get_all("CPlantedC4")
    local bomb_planted  = #bomb_table > 0
    local bomb_distance = 100

    if bomb_planted then
        local bomb_entity = bomb_table[#bomb_table]
        local bomb_pos = vector(entity.get_origin(bomb_entity))
        bomb_distance = local_pos:dist(bomb_pos)
    end

    local defusing = bomb_distance < 50 and nTeam == 3

    if defusing then return false end

    if in_use then
        cmd.in_use = 0
        return true
    end
    return false
end

local current_tickcount = 0
local to_jitter = false
local to_defensive = true
local first_execution = true
local yaw_amount = 0
local last_yaw = 0
local not_def_yaw = 0
local builder_items = nil
local jit_amount = 0
local safe_head = false

local function defensive_peek()
    to_defensive = false
end

local function defensive_disabler()
    to_defensive = true
end

local function normalize_yaw(yaw)
    return (yaw + 180) % 360 - 180
end
 
local function custom_spin(value, offset)
    if offset == 0 then
        return 0
    end

    if value >= 0 then
        tick = globals.tickcount() * value
        result = (tick % offset) - offset/2
        return result
    else
        tick = globals.tickcount() * value
        result = (tick % -offset) + offset/2
        return result
    end
end

local alive_players = {}

aa_setup = function(cmd)
    local lp = entity.get_local_player()
    if lp == nil then return end
    builder_items = antiaim_system[id]
    if antiaim_system[12].enable:get() and safe_head then id = 12
    elseif antiaim_system[11].enable:get() and is_freestand then id = 11
    elseif antiaim_system[10].enable:get() and cmd.in_use == 1 then id = 10
    elseif antiaim_system[9].enable:get() and yaw_direction ~= 0 then id = 9
    elseif player_state(cmd) == "Duck-Moving" and antiaim_system[8].enable:get() then id = 8
    elseif player_state(cmd) == "Duck" and antiaim_system[7].enable:get() then id = 7
    elseif player_state(cmd) == "Air+C" and antiaim_system[6].enable:get() then id = 6
    elseif player_state(cmd) == "Air" and antiaim_system[5].enable:get() then id = 5
    elseif player_state(cmd) == "Moving" and antiaim_system[4].enable:get() then id = 4
    elseif player_state(cmd) == "Walking" and antiaim_system[3].enable:get() then id = 3
    elseif player_state(cmd) == "Stand" and antiaim_system[2].enable:get() then id = 2
    else id = 1 end

    if id == 10 then
        legit_aa(cmd)
    end

    safe_head = false

    ui.set(ref.roll[1], 0)

    run_direction(cmd)

    if globals.tickcount() > current_tickcount + builder_items.yaw_delay:get() + math.random(0, builder_items.delay_random:get()) then
        if cmd.chokedcommands == 0 then
            to_jitter = not to_jitter
            current_tickcount = globals.tickcount()
        end
    elseif globals.tickcount() <  current_tickcount then
        current_tickcount = globals.tickcount()
    end

    if is_vulnerable() then
        if first_execution then
            first_execution = false
            to_defensive = true
            client.set_event_callback("setup_command", defensive_disabler)
        end
        if globals.tickcount() % 10 == 9 then
            defensive_peek()
            client.unset_event_callback("setup_command", defensive_disabler)
        end
    else
        first_execution = true
        to_defensive = false
    end

    ui.set(ref.fsbodyyaw, false)
    

    cmd.force_defensive = builder_items.force_def:get() or builder_items.peek_def:get() and to_defensive

    local desync_type = entity.get_prop(lp, 'm_flPoseParameter', 11) * 120 - 60
    local desync_side = desync_type > 0

    ui.set(ref.yaw[1], '180')
    ui.set(ref.pitch[1], antiaim_system[id].pitch:get())
    ui.set(ref.yawbase, lua_menu.antiaim.yaw_base:get())
    if builder_items.yaw_delay:get() > 1 and builder_items.body_yaw_type:get() == 'Jitter' then
        ui.set(ref.bodyyaw[1], "Static")
        ui.set(ref.bodyyaw[2], to_jitter and 1 or -1)
        ui.set(ref.yawjitter[1], 'Off')
        ui.set(ref.yawjitter[2], 0)
        local yaw_l = antiaim_system[id].yaw_override:get() and randomize_value(builder_items.yaw_right:get(), builder_items.yaw_random:get()) or antiaim_system[id].yaw_offset:get()
        local yaw_r = antiaim_system[id].yaw_override:get() and randomize_value(builder_items.yaw_left:get(), builder_items.yaw_random:get()) or antiaim_system[id].yaw_offset:get()
        jit_amount = randomize_value(builder_items.mod_dm:get(), builder_items.mod_random:get())

        if builder_items.mod_type:get() == 'Center' then
            yaw_amount = to_jitter and (yaw_l + jit_amount/2) or (yaw_r - jit_amount/2)
        elseif builder_items.mod_type:get() == 'Offset' then
            yaw_amount = to_jitter and (yaw_l) or (yaw_r - jit_amount/2)
        elseif builder_items.mod_type:get() == 'Random' then
            yaw_amount = to_jitter and (yaw_l + jit_amount/2) or (yaw_r - jit_amount/2)
        elseif builder_items.mod_type:get() == 'Skitter' then
            if globals.tickcount() % 3 == 0 then 
                yaw_amount = to_jitter and (yaw_l + jit_amount/2) or (yaw_r)
            elseif globals.tickcount() % 3 == 1 then 
                yaw_amount = to_jitter and (yaw_l) or (yaw_r)
            else
                yaw_amount = to_jitter and (yaw_l) or (yaw_r - jit_amount/2)
            end
        else
            yaw_amount = to_jitter and yaw_l or yaw_r
        end
        not_def_yaw = yaw_amount
    else
        ui.set(ref.bodyyaw[1], builder_items.body_yaw_type:get())
        ui.set(ref.bodyyaw[2], builder_items.body_yaw_type:get() == 'Jitter' and 1 or builder_items.body_slider:get())
        ui.set(ref.yawjitter[1], builder_items.mod_type:get())
        ui.set(ref.yawjitter[2], math.clamp(randomize_value(builder_items.mod_dm:get(), builder_items.mod_random:get()), -180, 180))
        if antiaim_system[id].yaw_override:get() then
            yaw_amount = desync_side and randomize_value(builder_items.yaw_left:get(), builder_items.yaw_random:get()) or randomize_value(builder_items.yaw_right:get(), builder_items.yaw_random:get())
        else
            yaw_amount = antiaim_system[id].yaw_offset:get()
        end
        not_def_yaw = yaw_amount
    end

    if is_defensive_active(lp) and builder_items.defensive:get() and not is_static then
        ui.set(ref.pitch[1], 'Custom')

        if antiaim_system[id].defensive_select:get('Jitter') then
            ui.set(ref.yawjitter[1], builder_items.def_mod_type:get())
            ui.set(ref.yawjitter[2], math.clamp(randomize_value(builder_items.def_mod_dm:get(), builder_items.def_mod_random:get()), -180, 180))
        end

        if antiaim_system[id].defensive_select:get('Body Yaw') then
            ui.set(ref.bodyyaw[1], builder_items.def_body_yaw_type:get()) 
            ui.set(ref.bodyyaw[2], builder_items.def_body_yaw_type:get() == 'Jitter' and 1 or builder_items.def_body_slider:get())
        end

        if builder_items.defensive_yaw:get() == "Spin" then
            yaw_amount = custom_spin(builder_items.spin_speed:get(), builder_items.spin_offset:get())
        elseif builder_items.defensive_yaw:get() == "Side~Ways" then
            yaw_amount = globals.tickcount() % 4 > 1 and builder_items.yaw_value:get()+not_def_yaw or -(builder_items.yaw_value:get()-not_def_yaw)
        elseif builder_items.defensive_yaw:get() == "Random" then
            yaw_amount = math.random(-builder_items.yaw_value:get(), builder_items.yaw_value:get())
        elseif builder_items.defensive_yaw:get() == "Offset" then
            yaw_amount = yaw_direction == 0 and builder_items.yaw_value:get() or yaw_direction
        elseif builder_items.defensive_yaw:get() == "Flick" then
            yaw_amount = globals.tickcount() % 1 > 2 and builder_items.yaw_value:get()+not_def_yaw or -(builder_items.yaw_value:get()-not_def_yaw)

        end
        if builder_items.defensive_pitch:get() == "Custom" then
            ui.set(ref.pitch[2], builder_items.pitch_value:get())
        elseif builder_items.defensive_pitch:get() == "Side~Ways" then
            ui.set(ref.pitch[2], globals.tickcount() % 4 > 1 and 49 or -49)
        elseif builder_items.defensive_pitch:get() == "Random" then
            ui.set(ref.pitch[2], math.random(-89, 89))
        elseif builder_items.defensive_pitch:get() == "Spin" then
            ui.set(ref.pitch[2], math.clamp(custom_spin(builder_items.pitch_speed:get(), builder_items.pitch_value:get()), -89, 89))
        else
            ui.set(ref.pitch[2], 89)
        end
    end

    ui.set(ref.yaw[2], yaw_direction == 0 and math.clamp(yaw_amount, -180, 180) or yaw_direction)

    if is_static then
        ui.set(ref.yaw[2], yaw_direction == 0 and 0 or yaw_direction)
        ui.set(ref.yawjitter[1], 'Off')
        ui.set(ref.yawjitter[2], 0)
        ui.set(ref.bodyyaw[1], 'Static')
        ui.set(ref.bodyyaw[2], 1)
    end

    local players = entity.get_players(true)
    if lua_menu.antiaim.aa_override:get('On Warmup') then
        if entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 1 then
            ui.set(ref.yaw[2], globals.tickcount() % 36 * 10 - 180)
            ui.set(ref.yawjitter[2], 0)
            ui.set(ref.bodyyaw[1], 'Static')
            ui.set(ref.bodyyaw[2], 0)
            ui.set(ref.pitch[1], "Custom")
            ui.set(ref.pitch[2], 0) 
            cmd.force_defensive = false
        end
    end

    for i=1, 64 do
        if entity.is_alive(i) and entity.is_enemy(i) then
            table.insert(alive_players, i)
        end
    end

    if lua_menu.antiaim.aa_override:get('No Enemies Alive') then
        if client.current_threat() == nil and #alive_players == 0 then
            ui.set(ref.yaw[2], globals.tickcount() % 36 * 10 - 180)
            ui.set(ref.yawjitter[2], 0)
            ui.set(ref.bodyyaw[1], 'Static')
            ui.set(ref.bodyyaw[2], 0)
            ui.set(ref.pitch[1], "Custom")
            ui.set(ref.pitch[2], 0) 
            cmd.force_defensive = false
        end
    end

    alive_players = {}

    if id == 10 then
        ui.set(ref.yawbase, 'Local View')
        ui.set(ref.pitch[1], "Off")
        ui.set(ref.yaw[1], 'Off')
    end

    local threat = client.current_threat()
    local lp_weapon = entity.get_player_weapon(lp)
    local lp_orig_x, lp_orig_y, lp_orig_z = entity.get_prop(lp, "m_vecOrigin")
    local flags = entity.get_prop(lp, 'm_fFlags')
    local jumpcheck = bit.band(flags, 1) == 0 or cmd.in_jump == 1
    local ducked = entity.get_prop(lp, 'm_flDuckAmount') > 0.7


    if lp_weapon ~= nil then
        if lua_menu.antiaim.safe_head:get("Air+C Knife") then
            if jumpcheck and ducked and entity.get_classname(lp_weapon) == "CKnife" then
                safe_head = true
            end
        end
        if lua_menu.antiaim.safe_head:get("Air+C Zeus") then
            if jumpcheck and ducked and entity.get_classname(lp_weapon) == "CWeaponTaser" then
                safe_head = true
            end
        end
        if lua_menu.antiaim.safe_head:get("Height Difference") then
            if threat ~= nil and is_vulnerable() then
                threat_x, threat_y, threat_z = entity.get_prop(threat, "m_vecOrigin")
                threat_dist = lp_orig_z - threat_z
                if threat_dist > lua_menu.antiaim.height_difference:get() then
                    safe_head = true
                end
            end
        end
        
        if lua_menu.antiaim.safe_head:get("Air+C SMG") then
            if jumpcheck and ducked and (entity.get_classname(lp_weapon) == "CWeaponMAC10" or entity.get_classname(lp_weapon) == "CWeaponMP9" or entity.get_classname(lp_weapon) == "CWeaponMP7" or entity.get_classname(lp_weapon) == "CWeaponUMP45" or entity.get_classname(lp_weapon) == "CWeaponBizon" or entity.get_classname(lp_weapon) == "CWeaponP90") then
                safe_head = true
            end
        end
    end

    if lua_menu.antiaim.yaw_options:get('Fake Peek') and yaw_direction ~= 0 then
        cmd.force_defensive = true
        if is_defensive_active(lp) then
            ui.set(ref.yaw[1], '180')
            ui.set(ref.yaw[2], -yaw_direction)
            ui.set(ref.pitch[2], math.random(-10, 10))
        end
    end

    if is_freestand and lua_menu.antiaim.fr_options:get('Fake Peek') and yaw_direction == 0 then
        if is_vulnerable() then
            cmd.force_defensive = true
            if not is_defensive_active(lp) then
                last_yaw = entity.get_prop(lp, 'm_flLowerBodyYawTarget')
            else    
                cmd.pitch = (math.random(-10, 10))
                if last_yaw > 0 then
                    cmd.yaw = normalize_yaw(last_yaw - 180)
                else
                    cmd.yaw = normalize_yaw(last_yaw + 180)
                end
            end
        end
    end

    if lua_menu.misc.antibackstab:get() then
        for i=1, #players do
            if players == nil then return end
            enemy_orig_x, enemy_orig_y, enemy_orig_z = entity.get_prop(players[i], "m_vecOrigin")
            distance_to = anti_knife_dist(lp_orig_x, lp_orig_y, lp_orig_z, enemy_orig_x, enemy_orig_y, enemy_orig_z)
            weapon = entity.get_player_weapon(players[i])
            if weapon == nil then return end
            if entity.get_classname(weapon) == "CKnife" and distance_to <= 250 then
                ui.set(ref.yaw[2], 180)
                ui.set(ref.yawbase, "At targets")
            end
        end
    end


    --Force Defensive Triggers

    local is_stand = lua_menu.antiaim.defensive_condition:get('Stand') and player_state(cmd) == 'Stand'
    local is_moving = lua_menu.antiaim.defensive_condition:get('Stand') and player_state(cmd) == 'Moving'
    local is_walking = lua_menu.antiaim.defensive_condition:get('Walking') and player_state(cmd) == 'Walking'
    local is_crouching = lua_menu.antiaim.defensive_condition:get('Crouching') and (player_state(cmd) == 'Duck' or player_state(cmd) == 'Duck-Moving')
    local is_air = lua_menu.antiaim.defensive_condition:get('Air') and (player_state(cmd) == 'Air' or player_state(cmd) == 'Air+C')

    if is_stand or is_moving or is_walking or is_crouching or is_air then
        if lua_menu.antiaim.defensive_triggers:get('Hittable') and is_vulnerable() then
            cmd.force_defensive = true
        end
        if lua_menu.antiaim.defensive_triggers:get('Reload') and entity.get_esp_data(lp).flags == 32 then
            cmd.force_defensive = true
        end
    end
end

local screen = {client.screen_size()}
local center = {screen[1]/2, screen[2]/2} 

math.lerp = function(name, value, speed)
    return name + (value - name) * globals.absoluteframetime() * speed
end

local rgba_to_hex = function(b, c, d, e)
    return string.format('%02x%02x%02x%02x', b, c, d, e)
end

function lerp(a, b, t)
    return a + (b - a) * t
end

function clamp(x, minval, maxval)
    if x < minval then
        return minval
    elseif x > maxval then
        return maxval
    else
        return x
    end
end

local function text_fade_animation(x, y, speed, color1, color2, text, flag)
    local final_text = ''
    local curtime = globals.curtime()

    for i = 0, #text do
        local x_offset = i * 10
        local wave = math.cos(8 * speed * curtime + x_offset / 30)
        local color = rgba_to_hex(
            lerp(color1.r, color2.r, clamp(wave, 0, 1)),
            lerp(color1.g, color2.g, clamp(wave, 0, 1)),
            lerp(color1.b, color2.b, clamp(wave, 0, 1)),
            color1.a
        )
        final_text = final_text .. '\a' .. color .. text:sub(i, i)
    end

    renderer.text(x, y, color1.r, color1.g, color1.b, color1.a, flag, nil, final_text)
end

local function fade_anim(speed, color1, color2, text)
    local final_text = ''
    local curtime = globals.curtime()

    for i = 0, #text do
        local x_offset = i * 10
        local wave = math.cos(8 * speed * curtime + x_offset / 30)
        local color = rgba_to_hex(
            lerp(color1.r, color2.r, clamp(wave, 0, 1)),
            lerp(color1.g, color2.g, clamp(wave, 0, 1)),
            lerp(color1.b, color2.b, clamp(wave, 0, 1)),
            color1.a
        )
        final_text = final_text .. '\a' .. color .. text:sub(i, i)
    end
    return final_text
end

local function doubletap_charged()
    if not ui.get(ref.dt[1]) or not ui.get(ref.dt[2]) or ui.get(ref.fakeduck) then return false end
    if not entity.is_alive(entity.get_local_player()) or entity.get_local_player() == nil then return end
    local weapon = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")
    if weapon == nil then return false end
    local next_attack = entity.get_prop(entity.get_local_player(), "m_flNextAttack") + 0.01
    local checkcheck = entity.get_prop(weapon, "m_flNextPrimaryAttack")
    if checkcheck == nil then return end
    local next_primary_attack = checkcheck + 0.01
    if next_attack == nil or next_primary_attack == nil then return false end
    return next_attack - globals.curtime() < 0 and next_primary_attack - globals.curtime() < 0
end

local scoped_space = 0

local desync = 0

breathe = function(offset, multiplier)
    local m_speed = globals.realtime() * (multiplier or 1.0);
    local m_factor = m_speed % math.pi;

    local m_sin = math.sin(m_factor + (offset or 0));
    local m_abs = math.abs(m_sin);

    return m_abs
end

local function screen_indicator()
    local lp = entity.get_local_player()
    if lp == nil then return end
    local scpd = entity.get_prop(lp, "m_bIsScoped") == 1
    scoped_space = math.lerp(scoped_space, scpd and 1 or 0, 20)
    local condition = "GLOBAL"
    if id == 1 then condition = "GLOBAL"
    elseif id == 2 then condition = "STANDING"
    elseif id == 3 then condition = "WALKING"
    elseif id == 4 then condition = "RUNNING"
    elseif id == 5 then condition = "AEROBIC"
    elseif id == 6 then condition = "AEROBIC"
    elseif id == 7 then condition = "DUCKING"
    elseif id == 8 then condition = "DUCKING" end
    local spaceind = 10
    local vel_mod = entity.get_prop(lp, 'm_flVelocityModifier')
    if vel_mod ~= 1 then
        desync = math.lerp(desync, math.max(vel_mod, 0.3), 10)
    else
        desync = math.lerp(desync, math.max(math.abs(entity.get_prop(lp, 'm_flPoseParameter', 11) * 120 - 60)/60, 0.3), 10)
    end

    lua_menu.visuals.cross_color:override(true)
    lua_menu.visuals.key_color:override(true)
    local r1, g1, b1, a1 = lua_menu.visuals.cross_ind:get_color()
    local r2, g2, b2, a2 = lua_menu.visuals.cross_color:get_color()
    local r3, g3, b3, a3 = lua_menu.visuals.key_color:get_color()
    local r, g, b, a = 255, 255, 255, 255

    local lolx, loly = renderer.measure_text('c', '.lua')
    local mainx, mainy = renderer.measure_text(lua_menu.visuals.cross_ind_type:get() == 'Default' and "c-" or 'cb', lua_menu.visuals.cross_ind_type:get() == 'Default' and "calamity.lua" or 'calamity')
    local dtx, dty = renderer.measure_text(lua_menu.visuals.cross_ind_type:get() == 'Default' and "c-" or 'b', lua_menu.visuals.cross_ind_type:get() == 'Default' and "DT" or 'dt')
    local bodyx, bodyy = renderer.measure_text(lua_menu.visuals.cross_ind_type:get() == 'Default' and "c-" or 'c', lua_menu.visuals.cross_ind_type:get() == 'Default' and "BODY" or 'body')
    local osaax, osaay = renderer.measure_text(lua_menu.visuals.cross_ind_type:get() == 'Default' and "c-" or 'c', lua_menu.visuals.cross_ind_type:get() == 'Default' and "OSAA" or 'osaa')
    local fsx, fsy = renderer.measure_text(lua_menu.visuals.cross_ind_type:get() == 'Default' and "c-" or 'c', lua_menu.visuals.cross_ind_type:get() == 'Default' and "FS" or 'fs')
    local dmgx, dmgy = renderer.measure_text(lua_menu.visuals.cross_ind_type:get() == 'Default' and "c-" or 'c', lua_menu.visuals.cross_ind_type:get() == 'Default' and "DMG" or 'dmg')
    local statex, statey = renderer.measure_text(lua_menu.visuals.cross_ind_type:get() == 'Default' and "c-" or 'c', lua_menu.visuals.cross_ind_type:get() == 'Default' and condition or '·'..string.lower(condition)..'·')

    if lua_menu.visuals.cross_ind_type:get() == 'Default' then

        text_fade_animation(center[1] + math.floor(scoped_space * 50), center[2] + 30, -1, {r=r1, g=g1, b=b1, a=255}, {r=r2, g=g2, b=b2, a=255}, "calamity.lua", "c-")

        renderer.rectangle(center[1] + math.floor(scoped_space * 50) - mainx/2 + 1, center[2] + 35, mainx+1, 3, 0, 0, 0, 255)
        renderer.rectangle(center[1] + math.floor(scoped_space * 50) - mainx/2 + 2, center[2] + 36, (mainx - 1)*desync, 1, 255, 255, 255, 255)
        renderer.text(center[1] + math.floor((statex + 56)*0.5 * scoped_space), center[2] + 42, r2, g2, b2, 255, "c-", 0, string.upper(condition))

        if ui.get(ref.forcebaim)then
            renderer.text(center[1] + math.floor((dtx + 65)*0.5 * scoped_space), center[2] + 40 + (spaceind), 255, 102, 117, 255, "c-", 0, "BODY")
            spaceind = spaceind + 9
        end

        if ui.get(ref.os[2]) then
            renderer.text(center[1] + math.floor((osaax + 55)*0.5 * scoped_space), center[2] + 40 + (spaceind), r3, g3, b3, 255, "c-", 0, "OSAA")
            spaceind = spaceind + 9
        end

        if ui.get(ref.minimum_damage_override[2]) then
            renderer.text(center[1] + math.floor((dmgx + 56)*0.5 * scoped_space), center[2] + 40 + (spaceind), r3, g3, b3, 255, "c-", 0, "DMG")
            spaceind = spaceind + 9
        end

        if ui.get(ref.dt[1]) and ui.get(ref.dt[2]) then
            if doubletap_charged() then
                renderer.text(center[1] + math.floor((dtx + 55)*0.5 * scoped_space), center[2] + 40 + (spaceind), r3, g3, b3, 255, "c-", 0, "DT")
            else
                renderer.text(center[1] + math.floor((dtx + 55)*0.5 * scoped_space), center[2] + 40 + (spaceind), 255, 0, 0, 255, "c-", 0, "DT")
            end
            spaceind = spaceind + 9
        end

        if ui.get(ref.freestand[1]) and ui.get(ref.freestand[2]) then
            renderer.text(center[1] + math.floor((dtx + 55)*0.5 * scoped_space), center[2] + 40 + (spaceind), r3, g3, b3, 255, "c-", 0, "FS")
            spaceind = spaceind + 9
        end
    else    
        local breathe_alpha = breathe(0, 2.0) * 255
        text_fade_animation(center[1] + math.floor(scoped_space * 52), center[2] + 30, -1, {r=r1, g=g1, b=b1, a=255}, {r=r2, g=g2, b=b2, a=255}, "calamity.lua", "cb")

        renderer.text(center[1] + math.floor((statex + 58)*0.5 * scoped_space), center[2] + 40, r2, g2, b2, 255, "c", 0, '·'..string.lower(condition)..'·')

        if ui.get(ref.forcebaim)then
            renderer.text(center[1] + math.floor((dtx + 72)*0.5 * scoped_space), center[2] + 42 + (spaceind), 255, 102, 117, 255, "c", 0, "body")
            spaceind = spaceind + 10
        end

        if ui.get(ref.os[2]) then
            renderer.text(center[1] + math.floor((osaax + 58)*0.5 * scoped_space), center[2] + 42 + (spaceind), r3, g3, b3, 255, "c", 0, "osaa")
            spaceind = spaceind + 10
        end

        if ui.get(ref.minimum_damage_override[2]) then
            renderer.text(center[1] + math.floor((dmgx + 58)*0.5 * scoped_space), center[2] + 42 + (spaceind), r3, g3, b3, 255, "c", 0, "dmg")
            spaceind = spaceind + 10
        end

        if ui.get(ref.dt[1]) and ui.get(ref.dt[2]) then
            if doubletap_charged() then
                renderer.text(center[1] + math.floor((dtx + 60)*0.5 * scoped_space), center[2] + 42 + (spaceind), r3, g3, b3, 255, "c", 0, "dt")
            else
                renderer.text(center[1] + math.floor((dtx + 60)*0.5 * scoped_space), center[2] + 42 + (spaceind), 255, 0, 0, 255, "c", 0, "dt")
            end
            spaceind = spaceind + 10
        end

        if ui.get(ref.freestand[1]) and ui.get(ref.freestand[2]) then
            renderer.text(center[1] + math.floor((dtx + 60)*0.5 * scoped_space), center[2] + 42 + (spaceind), r3, g3, b3, a, "c", 0, "fs")
            spaceind = spaceind + 10
        end
    end
end

local defensive_alpha = 0
local defensive_amount = 0
local velocity_alpha = 0
local velocity_amount = 0

local function velocity_ind()
    local lp = entity.get_local_player()
    if lp == nil then return end
    local r, g, b, a = lua_menu.visuals.velocity_window:get_color()
    local vel_mod = entity.get_prop(lp, 'm_flVelocityModifier')

    if not ui.is_menu_open() then
        velocity_alpha = math.lerp(velocity_alpha, vel_mod < 1 and 255 or 0, 5)
        velocity_amount = math.lerp(velocity_amount, vel_mod, 5)
    else
        velocity_alpha = math.lerp(velocity_alpha, 255, 5)
        velocity_amount = globals.tickcount() % 50/100 * 2
    end

    if velocity_alpha < 5 then return end

    renderer.text(center[1], screen[2] / 3 - 15, 255, 255, 255, velocity_alpha, "c", 0, "- velocity -")

    if lua_menu.visuals.velocity_window_type:get() == 'Default' then
        renderer.rectangle(center[1]-50, screen[2] / 3, 100, 5, 0,0,0, velocity_alpha)
        renderer.rectangle(center[1]-49, screen[2] / 3+1, (100*velocity_amount)-1, 3, r, g, b, velocity_alpha)
    else
        renderer.glow_module(center[1]-50 - math.floor(50*velocity_amount) + 50, screen[2] / 3, math.floor(100*velocity_amount), 3, 6, 3, {r, g, b, velocity_alpha/2}, {r, g, b, velocity_alpha})
    end
end

local function defensive_ind()
    local lp = entity.get_local_player()
    if lp == nil then return end
    local charged = doubletap_charged()
    local active = is_defensive_active(lp)
    local r, g, b, a = lua_menu.visuals.defensive_window:get_color()
    if not ui.is_menu_open() then
        if ui.get(ref.dt[1]) and ui.get(ref.dt[2]) and not ui.get(ref.fakeduck) then
            if charged and active then
                defensive_alpha = math.lerp(defensive_alpha, 255, 5)
                defensive_amount = math.lerp(defensive_amount, 1, 5)
            elseif charged and not active then
                defensive_alpha = math.lerp(defensive_alpha, 0, 5)
                defensive_amount = math.lerp(defensive_amount, 0.5, 5)
            else
                defensive_alpha = math.lerp(defensive_alpha, 255, 5)
                defensive_amount = math.lerp(defensive_amount, 0, 5)
            end
        else
            defensive_alpha = math.lerp(defensive_alpha, 0, 5)
            defensive_amount = math.lerp(defensive_amount, 0, 5)
        end
    else
        defensive_alpha = math.lerp(defensive_alpha, 255, 10)
        defensive_amount = globals.tickcount() % 50/100 * 2
    end

    if defensive_alpha < 5 then return end

    renderer.text(center[1], screen[2] / 4 - 15, 255, 255, 255, defensive_alpha, "c", 0, "- defensive -")

    if lua_menu.visuals.defensive_window_type:get() == 'Default' then
        renderer.rectangle(center[1]-50, screen[2] / 4, 100, 5, 0,0,0, defensive_alpha)
        renderer.rectangle(center[1]-49, screen[2] / 4+1, (100*defensive_amount)-1, 3, r, g, b, defensive_alpha)
    else
        renderer.glow_module(center[1]-50 - math.floor(50*defensive_amount) + 50, screen[2] / 4, math.floor(100*defensive_amount), 3, 6, 3, {r, g, b, defensive_alpha/2}, {r, g, b, defensive_alpha})
    end
end

local function air_qs(cmd)
    local lp = entity.get_local_player()
    if not lp then return end
    if not entity.is_alive(lp) then return end

    local ticks = 0
    local players = entity.get_players(true)
    local lpvec = vector(entity.get_prop(lp, "m_vecOrigin"))
    local weapon = entity.get_player_weapon(lp)
    local class = entity.get_classname(weapon)

    if class ~= "CWeaponSSG08" then return end
    local vecvelocity = { entity.get_prop(lp, 'm_vecVelocity') }

    local check_vel = vecvelocity[3] > 0
    local flags = entity.get_prop(lp, 'm_fFlags')
    local jumpcheck = bit.band(flags, 1) == 0

    local enemy = client.current_threat()
    if not enemy then return end
    if not jumpcheck then return end
    local enemyvec = vector(entity.get_origin(enemy))
    local trace_l = vector(entity.get_origin(lp))
    if not check_vel then return end
    for i=1, #players do
        if players == nil then return end
        local x1, y1, z1 = entity.get_prop(players[i], "m_vecOrigin")

        local dist = anti_knife_dist(lpvec.x, lpvec.y, lpvec.z, x1, y1, z1)
        if dist <= 1500 then
            if cmd.quick_stop then
                if (globals.tickcount() - ticks) > 3 then
                    cmd.in_speed = 1
                end
            else
                ticks = globals.tickcount()
            end
        end
    end
end

local prev_console = cvar.con_filter_text:get_string()

local function console_filter(value)
    cvar.con_filter_enable:set_int(value and 1 or 0)  
    cvar.con_filter_text:set_int(value and 1 or 0)
    cvar.con_filter_text_out:set_int(value and 1 or 0)
    cvar.con_filter_text:set_string(value and "__" or prev_console)
end

console_filter(lua_menu.misc.console:get())

lua_menu.misc.console:set_callback(function(self)
    console_filter(self:get())
end)

local shot_logger = {}

prefer_safe_point = ui.reference('RAGE', 'Aimbot', 'Prefer safe point')
force_safe_point = ui.reference('RAGE', 'Aimbot', 'Force safe point')

shot_logger.add = function(...)
    args = { ... }
    len = #args
    for i = 1, len do
        arg = args[i]
        r, g, b = unpack(arg)

        msg = {}

        if #arg == 3 then
            _G.table.insert(msg, " ")
        else
            for i = 4, #arg do
                _G.table.insert(msg, arg[i])
            end
        end
        msg = _G.table.concat(msg)

        if len > i then
            msg = msg .. "\0"
        end

        client.color_log(r, g, b, msg)


    end
end

shot_logger.bullet_impacts = {}
shot_logger.bullet_impact = function(e)
    local tick, me, user = globals.tickcount(), entity.get_local_player(), client.userid_to_entindex(e.userid)
    if user ~= me then return end
    if #shot_logger.bullet_impacts > 150 then shot_logger.bullet_impacts = {} end
    shot_logger.bullet_impacts[#shot_logger.bullet_impacts+1] = {tick = tick, eye = vector(client.eye_position()), shot = vector(e.x, e.y, e.z)}
end

shot_logger.get_inaccuracy_tick = function(pre_data, tick)
    for _, impact in pairs(shot_logger.bullet_impacts) do
        if impact.tick == tick then
            local spread_angle = vector((pre_data.eye-pre_data.shot_pos):angles()-(pre_data.eye-impact.shot):angles()):length2d()
            return spread_angle
        end
    end
    return -1
end

shot_logger.get_safety = function(aim_data, target)
    if not aim_data.boosted then return -1 end
    local plist_safety, ui_safety = plist.get(target, 'Override safe point'), {ui.get(prefer_safe_point), ui.get(force_safe_point) or plist_safety == 'On'}
    if plist_safety == 'Off' or not (ui_safety[1] or ui_safety[2]) then return 0 end
    return ui_safety[2] and 2 or (ui_safety[1] and 1 or 0)
end

shot_logger.generate_flags = function(pre_data)
    return {pre_data.self_choke > 1 and 1 or 0, pre_data.velocity_modifier < 1.00 and 1 or 0, pre_data.flags.boosted and 1 or 0}
end


shot_logger.hitboxes = {"generic", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg", "neck", "?", "gear"}
shot_logger.on_aim_fire = function(e)
	local p_ent = e.target
	local me = entity.get_local_player()

	shot_logger[e.id] = {
		original = e,
		dropped_packets = { },

		handle_time = globals.realtime(),
		self_choke = globals.chokedcommands(),

		flags = {
			boosted = e.boosted
		},

		feet_yaw = entity.get_prop(p_ent, 'm_flPoseParameter', 11)*120-60,
		correction = plist.get(p_ent, 'Correction active'),

		safety = shot_logger.get_safety(e, p_ent),
		shot_pos = vector(e.x, e.y, e.z),
		eye = vector(client.eye_position()),
		view = vector(client.camera_angles()),

		velocity_modifier = entity.get_prop(me, 'm_flVelocityModifier'),
		total_hits = entity.get_prop(me, 'm_totalHitsOnServer'),

		history = globals.tickcount() - e.tick
	}
end
shot_logger.on_aim_hit = function(e)
	if not lua_menu.visuals.ragebot_logs:get('Console') then return end

	if shot_logger[e.id] == nil then
		return 
	end

	local info = 
	{
		type = math.max(0, entity.get_prop(e.target, 'm_iHealth')) > 0,
		prefix = { lua_menu.visuals.ragebot_logs_hit:get() },
		hit = { lua_menu.visuals.ragebot_logs_hit:get() },
		name = entity.get_player_name(e.target),
		hitgroup = shot_logger.hitboxes[e.hitgroup + 1] or '?',
		flags = string.format('%s', _G.table.concat(shot_logger.generate_flags(shot_logger[e.id]))),
		aimed_hitgroup = shot_logger.hitboxes[shot_logger[e.id].original.hitgroup + 1] or '?',
		aimed_hitchance = string.format('%d%%', math.floor(shot_logger[e.id].original.hit_chance + 0.5)),
		hp = math.max(0, entity.get_prop(e.target, 'm_iHealth')),
		spread_angle = string.format('%.2f°', shot_logger.get_inaccuracy_tick(shot_logger[e.id], globals.tickcount())),
		correction = string.format('%d:%d°', shot_logger[e.id].correction and 1 or 0, (shot_logger[e.id].feet_yaw < 10 and shot_logger[e.id].feet_yaw > -10) and 0 or shot_logger[e.id].feet_yaw)
	}

	shot_logger.add({ info.prefix[1], info.prefix[2], info.prefix[3], 'calamity'}, 
					{ 134, 134, 134, ' » ' }, 
					{ 200, 200, 200, info.type and 'damaged ' or 'killed ' }, 
					{ info.hit[1], info.hit[2], info.hit[3],  info.name }, 
					{ 200, 200, 200, ' in the ' }, 
					{ info.hit[1], info.hit[2], info.hit[3], info.hitgroup }, 
					{ 200, 200, 200, info.type and info.hitgroup ~= info.aimed_hitgroup and ' (' or ''},
					{ info.hit[1], info.hit[2], info.hit[3], info.type and (info.hitgroup ~= info.aimed_hitgroup and info.aimed_hitgroup) or '' },
					{ 200, 200, 200, info.type and info.hitgroup ~= info.aimed_hitgroup and ']' or ''},
					{ 200, 200, 200, info.type and ' for ' or '' },
					{ info.hit[1], info.hit[2], info.hit[3], info.type and e.damage or '' },
					{ 200, 200, 200, info.type and e.damage ~= shot_logger[e.id].original.damage and ' (' or ''},
					{ info.hit[1], info.hit[2], info.hit[3], info.type and (e.damage ~= shot_logger[e.id].original.damage and shot_logger[e.id].original.damage) or '' },
					{ 200, 200, 200, info.type and e.damage ~= shot_logger[e.id].original.damage and ')' or ''},
					{ 200, 200, 200, info.type and ' damage' or '' },
					{ 200, 200, 200, info.type and ' (' or '' }, { info.hit[1], info.hit[2], info.hit[3], info.type and info.hp or '' }, { 200, 200, 200, info.type and ' hp remaning)' or '' },
					{ 200, 200, 200, ' [hc: ' }, { info.hit[1], info.hit[2], info.hit[3], info.aimed_hitchance }, { 200, 200, 200, ' | safety: ' }, { info.hit[1], info.hit[2], info.hit[3], shot_logger[e.id].safety },
					{ 200, 200, 200, ' | bt: ' }, { info.hit[1], info.hit[2], info.hit[3], shot_logger[e.id].history },
					{ 200, 200, 200, ']' })
end



shot_logger.on_aim_miss = function(e)
    if not lua_menu.visuals.ragebot_logs:get('Console') then return end

    local me = entity.get_local_player()
    local info = {
        prefix = {lua_menu.visuals.ragebot_logs_miss:get()},
        hit = {lua_menu.visuals.ragebot_logs_miss:get()},
        name = entity.get_player_name(e.target),
        hitgroup = shot_logger.hitboxes[e.hitgroup + 1] or '?',
        flags = string.format('%s', _G.table.concat(shot_logger.generate_flags(shot_logger[e.id]))),
        aimed_hitgroup = shot_logger.hitboxes[shot_logger[e.id].original.hitgroup + 1] or '?',
        aimed_hitchance = string.format('%d%%', math.floor(shot_logger[e.id].original.hit_chance + 0.5)),
        hp = math.max(0, entity.get_prop(e.target, 'm_iHealth')),
        reason = e.reason == '?' and (shot_logger[e.id].total_hits ~= entity.get_prop(me, 'm_totalHitsOnServer') and 'damage rejection' or 'resolver') or e.reason,
        spread_angle = string.format('%.2f°', shot_logger.get_inaccuracy_tick(shot_logger[e.id], globals.tickcount())),
        correction = string.format('%d:%d°', shot_logger[e.id].correction and 1 or 0, (shot_logger[e.id].feet_yaw < 10 and shot_logger[e.id].feet_yaw > -10) and 0 or shot_logger[e.id].feet_yaw)
    }

    shot_logger.add(
        {info.prefix[1], info.prefix[2], info.prefix[3], 'calamity'}, {134, 134, 134, ' » '}, 
        {200, 200, 200, 'missed shot at '}, {info.hit[1], info.hit[2], info.hit[3], info.name}, 
        {200, 200, 200, ' in the '}, {info.hit[1], info.hit[2], info.hit[3], info.hitgroup}, 
        {200, 200, 200, ' due to '}, {info.hit[1], info.hit[2], info.hit[3], info.reason},
        {200, 200, 200, ' [hc: '}, {info.hit[1], info.hit[2], info.hit[3], info.aimed_hitchance}, 
        {200, 200, 200, ' | safety: '}, {info.hit[1], info.hit[2], info.hit[3], shot_logger[e.id].safety},
        {200, 200, 200, ' | bt: '}, {info.hit[1], info.hit[2], info.hit[3], shot_logger[e.id].history},
        {200, 200, 200, ']'}
    )
end

client.set_event_callback('aim_fire', shot_logger.on_aim_fire)
client.set_event_callback('aim_miss', shot_logger.on_aim_miss)
client.set_event_callback('aim_hit', shot_logger.on_aim_hit)
client.set_event_callback('bullet_impact', shot_logger.bullet_impact)

local logs = {}
local function ragebot_logs()
    local offset, x, y = 0, screen[1] / 2, screen[2] / 1.4
    for idx, data in ipairs(logs) do
        if (((globals.curtime()/2) * 2.0) - data[3]) < 4.0 and not (#logs > 5 and idx < #logs - 5) then
            data[2] = math.lerp(data[2], 255, 10)
        else
            data[2] = math.lerp(data[2], 0, 10)
        end
        offset = offset - 40 * (data[2] / 255)

        local r, g, b = unpack(data[4])
        text_size_x, text_sise_y = renderer.measure_text("", data[1])
        renderer.glow_module(x - 7 - text_size_x / 2, y - offset-4, text_size_x + 13, 20, 4, 8, {r, g, b, data[2]/2}, {20, 20, 20, data[2]/2})
        renderer.text(x - 1 - text_size_x / 2, y - offset+1, 255, 255, 255, data[2], "", 0, data[1])
        if data[2] < 0.1 or not entity.get_local_player() then table.remove(logs, idx) end
    end
end

renderer.log = function(text, color)
    table.insert(logs, { text, 0, ((globals.curtime() / 2) * 2.0), color})
end

local hitgroup_names = {'generic', 'head', 'chest', 'stomach', 'left arm', 'right arm', 'left leg', 'right leg', 'neck', '?', 'gear'}

local function aim_hit(e)
    breaker.tickbase_check = false
    breaker.cmd = 0
    breaker.defensive = 0
    breaker.defensive_check = 0
    if not lua_menu.visuals.ragebot_logs:get('Screen') then return end
    local group = hitgroup_names[e.hitgroup + 1] or '?'
    renderer.log(string.format('Hit %s in the %s for %d damage', entity.get_player_name(e.target) or "amigus", group, e.damage or 0), {lua_menu.visuals.ragebot_logs_hit:get()})
end
client.set_event_callback('aim_hit', aim_hit)

local function aim_miss(e)
    breaker.tickbase_check = false
    breaker.cmd = 0
    breaker.defensive = 0
    breaker.defensive_check = 0
    if not lua_menu.visuals.ragebot_logs:get('Screen') then return end
    local group = hitgroup_names[e.hitgroup + 1] or '?'
    renderer.log(string.format('Missed %s in the %s due to %s', entity.get_player_name(e.target) or "amigus", group, e.reason or "?"), {lua_menu.visuals.ragebot_logs_miss:get()})
end
client.set_event_callback('aim_miss', aim_miss)

local function fastladder(e)
    local me = entity.get_local_player()
    if entity.get_prop(me, "m_MoveType") == 9 then 
        local forward = vector(entity.get_prop(me, "m_vecLadderNormal"));
        if forward:lengthsqr() == 0 then return end

        local view = vector(client.camera_angles())
        local angle = vector(forward:angles())

        local delta_yaw = angle.y - view.y + 180
        local delta_pitch = angle.x - view.x

        delta_yaw = normalize_yaw(delta_yaw)
        delta_pitch = math.clamp(delta_pitch, -89, 89)

        local abs_yaw = math.abs(delta_yaw)

        local pitch = 89
        local yaw_offset = -90

        local is_looking_down = delta_pitch < -45
        local is_looking_to_right = delta_yaw > 0

        local is_sidemove = e.sidemove > 0
        local is_forwardmove = e.forwardmove > 0

            -- sideways
        if abs_yaw > 70 and abs_yaw < 135 then
            if e.forwardmove ~= 0 or e.sidemove == 0 then
                return;
            end

            if not is_looking_to_right then
                yaw_offset = -yaw_offset
            end

            if is_looking_to_right then
                is_sidemove = not is_sidemove
            end

            e.in_back = is_sidemove and 1 or 0
            e.in_forward = is_sidemove and 0 or 1

            if is_looking_to_right then
                is_sidemove = not is_sidemove
            end

            e.in_moveleft = is_sidemove and 1 or 0
            e.in_moveright = is_sidemove and 0 or 1

            e.pitch = pitch
            e.yaw = normalize_yaw(angle.y + yaw_offset)

            return
        end

            -- straight
        if e.sidemove ~= 0 or e.forwardmove == 0 then
            return
        end

        if not is_looking_to_right then
            yaw_offset = -yaw_offset
        end

        if not is_looking_down then
            is_forwardmove = not is_forwardmove
        end

        e.in_back = is_forwardmove and 0 or 1
        e.in_forward = is_forwardmove and 1 or 0

        if not is_looking_to_right then
            is_forwardmove = not is_forwardmove
        end

        e.in_moveleft = is_forwardmove and 1 or 0
        e.in_moveright = is_forwardmove and 0 or 1

        e.pitch = pitch
        e.yaw = normalize_yaw(angle.y + yaw_offset)
    end
end

local function lol_predict(value)
    if value then
        cvar.sv_max_allowed_net_graph:set_int(2)
        cvar.cl_interpolate:set_int(0)
        cvar.cl_interp_ratio:set_int(1)
        cvar.cl_interp:set_float(0.031000)
    else
        cvar.sv_max_allowed_net_graph:set_int(1)
        cvar.cl_interpolate:set_int(1)
        cvar.cl_interp_ratio:set_int(2)
        cvar.cl_interp:set_float(0.015626)
    end
end

lol_predict(lua_menu.misc.predict:get())

lua_menu.misc.predict:set_callback(function(self)
    lol_predict(self:get())
end)

local function check_charge()
    local lp = entity.get_local_player()
    local m_nTickBase = entity.get_prop(lp, 'm_nTickBase')
    local client_latency = client.latency()
    local shift = math.floor(m_nTickBase - globals.tickcount() - 3 - toticks(client_latency) * .5 + .5 * (client_latency * 10))
    local wanted = -14 + (ui.get(ref.doubletap.fakelag_limit) - 1) + 3
    return shift <= wanted
end

local function defensive_fix(cmd)
    local lp = entity.get_local_player()
    if not lp or not entity.is_alive(lp) then return end
    local on_ground = bit.band(entity.get_prop(lp, 'm_fFlags'), 1) == 1
    if on_ground and ui.get(ref.peek[1]) and ui.get(ref.peek[2]) and check_charge() and cmd.quick_stop then
        cmd.in_speed = 1
    end
end

local is_hittable = false

local function unsafe_charge(cmd)
    local lp = entity.get_local_player()
    if not lp or not entity.is_alive(lp) then return end
    local my_weapon = entity.get_player_weapon(lp)
    if not my_weapon then return end

    local can_shoot = entity.get_prop(my_weapon, "m_flNextPrimaryAttack") < globals.curtime()

    local threat = client.current_threat()
    local in_air = bit.band(entity.get_prop(lp, 'm_fFlags'), 1) == 0
    
    if threat then
        is_hittable = bit.band(entity.get_esp_data(threat).flags, bit.lshift(1, 11)) == 2048
    else
        is_hittable = false
    end

    if is_hittable and not check_charge() and ui.get(ref.doubletap.main[1]) and ui.get(ref.doubletap.main[2]) then
        if in_air then
            ui.set(ref.aimbot, false)
        elseif lua_menu.misc.unsafe_type:get() == 'Alternative' and not can_shoot then
            ui.set(ref.aimbot, false)
        else
            ui.set(ref.aimbot, true)
        end
    else
        ui.set(ref.aimbot, true)
    end
end

local function thirdperson(value)
    if value ~= nil then
        cvar.cam_idealdist:set_int(value)
    end
end

local function aspectratio(value)
    if value then
        cvar.r_aspectratio:set_float(value)
    end
end


local config_cfg = {lua_menu, antiaim_system}

local package, data, encrypted, decrypted = pui.setup(config_cfg), "", "", ""
config = {}

local cfg_system = {}
configs_db = database.read(lua_db.configs) or { }
configs_db.cfg_list = configs_db.cfg_list or {{'Default', 'W3sidmlzdWFscyI6eyJkZWZlbnNpdmVfd2luZG93X3R5cGUiOiJNb2Rlcm4iLCJjcm9zc19jb2xvciI6dHJ1ZSwiZGVmZW5zaXZlX3dpbmRvd19jIjoiI0ZGRkZGRkZGIiwicmFnZWJvdF9sb2dzIjpbIkNvbnNvbGUiLCJTY3JlZW4iLCJ+Il0sInJhZ2Vib3RfbG9nc19taXNzIjoiI0JENjM2MEZGIiwiY3Jvc3NfY29sb3JfYyI6IiM2NDY0NjRGRiIsInJhZ2Vib3RfbG9nc19oaXQiOiIjNzRCRDYwRkYiLCJjcm9zc19pbmQiOnRydWUsImNyb3NzX2luZF9jIjoiI0M4QzhDOEZGIiwia2V5X2NvbG9yIjp0cnVlLCJ2ZWxvY2l0eV93aW5kb3dfYyI6IiNGRkZGRkZGRiIsImtleV9jb2xvcl9jIjoiI0ZGRkZGRkZGIiwiY3Jvc3NfaW5kX3R5cGUiOiJEZWZhdWx0IiwiZGVmZW5zaXZlX3dpbmRvdyI6dHJ1ZSwidmVsb2NpdHlfd2luZG93X3R5cGUiOiJNb2Rlcm4iLCJ2ZWxvY2l0eV93aW5kb3ciOnRydWV9LCJtaXNjIjp7InByZWRpY3QiOnRydWUsImZhc3RfbGFkZGVyIjp0cnVlLCJ1bnNhZmVfcmVjaGFyZ2UiOnRydWUsInVuc2FmZV90eXBlIjoiQWx0ZXJuYXRpdmUiLCJhc3BlY3RyYXRpbyI6dHJ1ZSwiYWlycXNiaW5kIjpbMSw1LCJ+Il0sImNvbnNvbGUiOnRydWUsImFzcGVjdHJhdGlvX3ZhbHVlIjoxMzMsImRlZmVuc2l2ZV9maXgiOnRydWUsImFpcnFzIjp0cnVlLCJ0aGlyZF9wZXJzb24iOnRydWUsImFudGliYWNrc3RhYiI6dHJ1ZSwidGhpcmRfcGVyc29uX3ZhbHVlIjo0NX0sIm1haW4iOnsidGFiIjoiQ29uZmlnIn0sImFudGlhaW0iOnsidGFiIjoiQnVpbGRlciIsImRlZmVuc2l2ZV9jb25kaXRpb24iOlsifiJdLCJ5YXdfb3B0aW9ucyI6WyJEaXNhYmxlIFlhdyBNb2RpZmllciIsIn4iXSwia2V5X2xlZnQiOlsxLDkwLCJ+Il0sInNhZmVfaGVhZCI6WyJBaXIrQyBLbmlmZSIsIkFpcitDIFpldXMiLCJIZWlnaHQgRGlmZmVyZW5jZSIsIn4iXSwiZnJfb3B0aW9ucyI6WyJ+Il0sImZyX2Rpc2FibGVycyI6WyJXYWxraW5nIiwiQ3JvdWNoIiwiQWlyIiwifiJdLCJhYV9vdmVycmlkZSI6WyJ+Il0sInlhd19iYXNlIjoiTG9jYWwgdmlldyIsImVkZ2VfeWF3IjpbMSwwLCJ+Il0sImtleV9mb3J3YXJkIjpbMSwwLCJ+Il0sIm1hbnVhbF9kaXJlY3Rpb24iOnRydWUsImhlaWdodF9kaWZmZXJlbmNlIjoyMDAsImNvbmRpdGlvbiI6IkxlZ2l0IEFBIiwieWF3X2RpcmVjdGlvbiI6dHJ1ZSwiZGVmZW5zaXZlX3RyaWdnZXJzIjpbIn4iXSwiZnJlZXN0YW5kaW5nIjpbMSwwLCJ+Il0sImtleV9yaWdodCI6WzEsNjcsIn4iXX0sImNvbmZpZyI6eyJsaXN0Ijo0LCJuYW1lIjoia3cifX0sW3siZW5hYmxlIjpmYWxzZSwiZGVmX21vZF9yYW5kb20iOjAsIm1vZF90eXBlIjoiT2ZmIiwieWF3X29mZnNldCI6MCwicGVla19kZWYiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmYiLCJkZWxheV9yYW5kb20iOjEsImJvZHlfc2xpZGVyIjowLCJib2R5X3lhd190eXBlIjoiT2ZmIiwieWF3X3JhbmRvbSI6MCwiZGVmX2JvZHlfc2xpZGVyIjowLCJkZWZlbnNpdmUiOmZhbHNlLCJtb2RfZG0iOjAsImRlZl9tb2RfZG0iOjAsImRlZmVuc2l2ZV9zZWxlY3QiOlsifiJdLCJ5YXdfcmlnaHQiOjAsImZvcmNlX2RlZiI6ZmFsc2UsInlhd19kZWxheSI6MSwiZGVmX2JvZHlfeWF3X3R5cGUiOiJPZmYiLCJkZWZlbnNpdmVfeWF3IjoiT2ZmIiwiZGVmX21vZF90eXBlIjoiT2ZmIiwieWF3X3ZhbHVlIjowLCJtb2RfcmFuZG9tIjowLCJzcGluX29mZnNldCI6MzYwLCJzcGluX3NwZWVkIjoxMCwicGl0Y2hfc3BlZWQiOjAsInlhd19vdmVycmlkZSI6ZmFsc2UsInlhd19sZWZ0IjowLCJwaXRjaF92YWx1ZSI6MCwicGl0Y2giOiJEb3duIn0seyJlbmFibGUiOnRydWUsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6IkNlbnRlciIsInlhd19vZmZzZXQiOjMsInBlZWtfZGVmIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiT2ZmIiwiZGVsYXlfcmFuZG9tIjo0LCJib2R5X3NsaWRlciI6MSwiYm9keV95YXdfdHlwZSI6IkppdHRlciIsInlhd19yYW5kb20iOjAsImRlZl9ib2R5X3NsaWRlciI6MSwiZGVmZW5zaXZlIjpmYWxzZSwibW9kX2RtIjotMTgsImRlZl9tb2RfZG0iOi01MCwiZGVmZW5zaXZlX3NlbGVjdCI6WyJKaXR0ZXIiLCJCb2R5IFlhdyIsIn4iXSwieWF3X3JpZ2h0IjowLCJmb3JjZV9kZWYiOmZhbHNlLCJ5YXdfZGVsYXkiOjIsImRlZl9ib2R5X3lhd190eXBlIjoiSml0dGVyIiwiZGVmZW5zaXZlX3lhdyI6Ik9mZnNldCIsImRlZl9tb2RfdHlwZSI6IlNraXR0ZXIiLCJ5YXdfdmFsdWUiOjMsIm1vZF9yYW5kb20iOjAsInNwaW5fb2Zmc2V0IjozNjAsInNwaW5fc3BlZWQiOjEwLCJwaXRjaF9zcGVlZCI6MSwieWF3X292ZXJyaWRlIjpmYWxzZSwieWF3X2xlZnQiOjAsInBpdGNoX3ZhbHVlIjo4OSwicGl0Y2giOiJEb3duIn0seyJlbmFibGUiOnRydWUsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6IlNraXR0ZXIiLCJ5YXdfb2Zmc2V0IjozLCJwZWVrX2RlZiI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkN1c3RvbSIsImRlbGF5X3JhbmRvbSI6MSwiYm9keV9zbGlkZXIiOjEsImJvZHlfeWF3X3R5cGUiOiJKaXR0ZXIiLCJ5YXdfcmFuZG9tIjowLCJkZWZfYm9keV9zbGlkZXIiOjAsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZF9kbSI6LTQwLCJkZWZfbW9kX2RtIjotNjUsImRlZmVuc2l2ZV9zZWxlY3QiOlsiSml0dGVyIiwiQm9keSBZYXciLCJ+Il0sInlhd19yaWdodCI6MCwiZm9yY2VfZGVmIjpmYWxzZSwieWF3X2RlbGF5IjoxLCJkZWZfYm9keV95YXdfdHlwZSI6Ik9wcG9zaXRlIiwiZGVmZW5zaXZlX3lhdyI6IkZsaWNrIiwiZGVmX21vZF90eXBlIjoiT2ZmIiwieWF3X3ZhbHVlIjo5MCwibW9kX3JhbmRvbSI6MCwic3Bpbl9vZmZzZXQiOjM2MCwic3Bpbl9zcGVlZCI6MTAsInBpdGNoX3NwZWVkIjoyLCJ5YXdfb3ZlcnJpZGUiOmZhbHNlLCJ5YXdfbGVmdCI6MCwicGl0Y2hfdmFsdWUiOi0yNiwicGl0Y2giOiJEb3duIn0seyJlbmFibGUiOnRydWUsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6IkNlbnRlciIsInlhd19vZmZzZXQiOi0yLCJwZWVrX2RlZiI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6Ik9mZiIsImRlbGF5X3JhbmRvbSI6MSwiYm9keV9zbGlkZXIiOjEsImJvZHlfeWF3X3R5cGUiOiJKaXR0ZXIiLCJ5YXdfcmFuZG9tIjowLCJkZWZfYm9keV9zbGlkZXIiOjAsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZF9kbSI6NTMsImRlZl9tb2RfZG0iOi01MCwiZGVmZW5zaXZlX3NlbGVjdCI6WyJKaXR0ZXIiLCJ+Il0sInlhd19yaWdodCI6MywiZm9yY2VfZGVmIjpmYWxzZSwieWF3X2RlbGF5IjoyLCJkZWZfYm9keV95YXdfdHlwZSI6Ik9mZiIsImRlZmVuc2l2ZV95YXciOiJPZmZzZXQiLCJkZWZfbW9kX3R5cGUiOiJTa2l0dGVyIiwieWF3X3ZhbHVlIjozLCJtb2RfcmFuZG9tIjowLCJzcGluX29mZnNldCI6MzYwLCJzcGluX3NwZWVkIjoxMCwicGl0Y2hfc3BlZWQiOjAsInlhd19vdmVycmlkZSI6ZmFsc2UsInlhd19sZWZ0IjozLCJwaXRjaF92YWx1ZSI6MCwicGl0Y2giOiJEb3duIn0seyJlbmFibGUiOnRydWUsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6IkNlbnRlciIsInlhd19vZmZzZXQiOjAsInBlZWtfZGVmIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiQ3VzdG9tIiwiZGVsYXlfcmFuZG9tIjo2LCJib2R5X3NsaWRlciI6MSwiYm9keV95YXdfdHlwZSI6IkppdHRlciIsInlhd19yYW5kb20iOjAsImRlZl9ib2R5X3NsaWRlciI6MSwiZGVmZW5zaXZlIjpmYWxzZSwibW9kX2RtIjo1MywiZGVmX21vZF9kbSI6LTUxLCJkZWZlbnNpdmVfc2VsZWN0IjpbIkppdHRlciIsIkJvZHkgWWF3IiwifiJdLCJ5YXdfcmlnaHQiOjMsImZvcmNlX2RlZiI6ZmFsc2UsInlhd19kZWxheSI6MiwiZGVmX2JvZHlfeWF3X3R5cGUiOiJPcHBvc2l0ZSIsImRlZmVuc2l2ZV95YXciOiJGbGljayIsImRlZl9tb2RfdHlwZSI6Ik9mZiIsInlhd192YWx1ZSI6OTAsIm1vZF9yYW5kb20iOjAsInNwaW5fb2Zmc2V0IjozNjAsInNwaW5fc3BlZWQiOjEwLCJwaXRjaF9zcGVlZCI6LTEsInlhd19vdmVycmlkZSI6ZmFsc2UsInlhd19sZWZ0IjozLCJwaXRjaF92YWx1ZSI6LTQyLCJwaXRjaCI6IkRvd24ifSx7ImVuYWJsZSI6dHJ1ZSwiZGVmX21vZF9yYW5kb20iOjAsIm1vZF90eXBlIjoiQ2VudGVyIiwieWF3X29mZnNldCI6MTEsInBlZWtfZGVmIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiU3BpbiIsImRlbGF5X3JhbmRvbSI6MSwiYm9keV9zbGlkZXIiOjEsImJvZHlfeWF3X3R5cGUiOiJKaXR0ZXIiLCJ5YXdfcmFuZG9tIjo2LCJkZWZfYm9keV9zbGlkZXIiOjEsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZF9kbSI6NjIsImRlZl9tb2RfZG0iOi01MSwiZGVmZW5zaXZlX3NlbGVjdCI6WyJKaXR0ZXIiLCJCb2R5IFlhdyIsIn4iXSwieWF3X3JpZ2h0IjoxMCwiZm9yY2VfZGVmIjpmYWxzZSwieWF3X2RlbGF5IjoxLCJkZWZfYm9keV95YXdfdHlwZSI6Ik9wcG9zaXRlIiwiZGVmZW5zaXZlX3lhdyI6IlNpZGV+V2F5cyIsImRlZl9tb2RfdHlwZSI6Ik9mZiIsInlhd192YWx1ZSI6MTU2LCJtb2RfcmFuZG9tIjowLCJzcGluX29mZnNldCI6MzYwLCJzcGluX3NwZWVkIjoxMCwicGl0Y2hfc3BlZWQiOjQsInlhd19vdmVycmlkZSI6ZmFsc2UsInlhd19sZWZ0IjoxMSwicGl0Y2hfdmFsdWUiOjg5LCJwaXRjaCI6IkRvd24ifSx7ImVuYWJsZSI6dHJ1ZSwiZGVmX21vZF9yYW5kb20iOjEwLCJtb2RfdHlwZSI6IkNlbnRlciIsInlhd19vZmZzZXQiOjYsInBlZWtfZGVmIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiQ3VzdG9tIiwiZGVsYXlfcmFuZG9tIjoxLCJib2R5X3NsaWRlciI6MSwiYm9keV95YXdfdHlwZSI6IkppdHRlciIsInlhd19yYW5kb20iOjEyLCJkZWZfYm9keV9zbGlkZXIiOjEsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZF9kbSI6NTUsImRlZl9tb2RfZG0iOjAsImRlZmVuc2l2ZV9zZWxlY3QiOlsiSml0dGVyIiwiQm9keSBZYXciLCJ+Il0sInlhd19yaWdodCI6NywiZm9yY2VfZGVmIjpmYWxzZSwieWF3X2RlbGF5IjoxLCJkZWZfYm9keV95YXdfdHlwZSI6IlN0YXRpYyIsImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmX21vZF90eXBlIjoiT2ZmIiwieWF3X3ZhbHVlIjoxODAsIm1vZF9yYW5kb20iOjEwLCJzcGluX29mZnNldCI6MzYwLCJzcGluX3NwZWVkIjo5LCJwaXRjaF9zcGVlZCI6MCwieWF3X292ZXJyaWRlIjpmYWxzZSwieWF3X2xlZnQiOjcsInBpdGNoX3ZhbHVlIjotODksInBpdGNoIjoiRG93biJ9LHsiZW5hYmxlIjp0cnVlLCJkZWZfbW9kX3JhbmRvbSI6MTAsIm1vZF90eXBlIjoiQ2VudGVyIiwieWF3X29mZnNldCI6NiwicGVla19kZWYiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJDdXN0b20iLCJkZWxheV9yYW5kb20iOjEsImJvZHlfc2xpZGVyIjoxLCJib2R5X3lhd190eXBlIjoiSml0dGVyIiwieWF3X3JhbmRvbSI6MTMsImRlZl9ib2R5X3NsaWRlciI6LTEsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZF9kbSI6NTAsImRlZl9tb2RfZG0iOjAsImRlZmVuc2l2ZV9zZWxlY3QiOlsiSml0dGVyIiwiQm9keSBZYXciLCJ+Il0sInlhd19yaWdodCI6MjIsImZvcmNlX2RlZiI6ZmFsc2UsInlhd19kZWxheSI6MSwiZGVmX2JvZHlfeWF3X3R5cGUiOiJTdGF0aWMiLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZl9tb2RfdHlwZSI6Ik9mZiIsInlhd192YWx1ZSI6MTgwLCJtb2RfcmFuZG9tIjoxMCwic3Bpbl9vZmZzZXQiOjM2MCwic3Bpbl9zcGVlZCI6NSwicGl0Y2hfc3BlZWQiOjAsInlhd19vdmVycmlkZSI6ZmFsc2UsInlhd19sZWZ0IjowLCJwaXRjaF92YWx1ZSI6LTg5LCJwaXRjaCI6IkRvd24ifSx7ImVuYWJsZSI6ZmFsc2UsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6Ik9mZiIsInlhd19vZmZzZXQiOjAsInBlZWtfZGVmIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiT2ZmIiwiZGVsYXlfcmFuZG9tIjoxLCJib2R5X3NsaWRlciI6MCwiYm9keV95YXdfdHlwZSI6Ik9mZiIsInlhd19yYW5kb20iOjAsImRlZl9ib2R5X3NsaWRlciI6MCwiZGVmZW5zaXZlIjpmYWxzZSwibW9kX2RtIjowLCJkZWZfbW9kX2RtIjowLCJkZWZlbnNpdmVfc2VsZWN0IjpbIn4iXSwieWF3X3JpZ2h0IjowLCJmb3JjZV9kZWYiOmZhbHNlLCJ5YXdfZGVsYXkiOjEsImRlZl9ib2R5X3lhd190eXBlIjoiT2ZmIiwiZGVmZW5zaXZlX3lhdyI6Ik9mZiIsImRlZl9tb2RfdHlwZSI6Ik9mZiIsInlhd192YWx1ZSI6MCwibW9kX3JhbmRvbSI6MCwic3Bpbl9vZmZzZXQiOjM2MCwic3Bpbl9zcGVlZCI6MTAsInBpdGNoX3NwZWVkIjowLCJ5YXdfb3ZlcnJpZGUiOmZhbHNlLCJ5YXdfbGVmdCI6MCwicGl0Y2hfdmFsdWUiOjAsInBpdGNoIjoiT2ZmIn0seyJlbmFibGUiOnRydWUsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6Ik9mZiIsInlhd19vZmZzZXQiOjE4MCwicGVla19kZWYiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmYiLCJkZWxheV9yYW5kb20iOjEsImJvZHlfc2xpZGVyIjowLCJib2R5X3lhd190eXBlIjoiSml0dGVyIiwieWF3X3JhbmRvbSI6MCwiZGVmX2JvZHlfc2xpZGVyIjowLCJkZWZlbnNpdmUiOmZhbHNlLCJtb2RfZG0iOjEwNiwiZGVmX21vZF9kbSI6MCwiZGVmZW5zaXZlX3NlbGVjdCI6WyJ+Il0sInlhd19yaWdodCI6MCwiZm9yY2VfZGVmIjpmYWxzZSwieWF3X2RlbGF5IjoxLCJkZWZfYm9keV95YXdfdHlwZSI6Ik9mZiIsImRlZmVuc2l2ZV95YXciOiJPZmYiLCJkZWZfbW9kX3R5cGUiOiJPZmYiLCJ5YXdfdmFsdWUiOjAsIm1vZF9yYW5kb20iOjAsInNwaW5fb2Zmc2V0IjozNjAsInNwaW5fc3BlZWQiOjEwLCJwaXRjaF9zcGVlZCI6MCwieWF3X292ZXJyaWRlIjpmYWxzZSwieWF3X2xlZnQiOjAsInBpdGNoX3ZhbHVlIjowLCJwaXRjaCI6Ik9mZiJ9LHsiZW5hYmxlIjp0cnVlLCJkZWZfbW9kX3JhbmRvbSI6MCwibW9kX3R5cGUiOiJPZmYiLCJ5YXdfb2Zmc2V0Ijo1LCJwZWVrX2RlZiI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkN1c3RvbSIsImRlbGF5X3JhbmRvbSI6MSwiYm9keV9zbGlkZXIiOjEsImJvZHlfeWF3X3R5cGUiOiJTdGF0aWMiLCJ5YXdfcmFuZG9tIjowLCJkZWZfYm9keV9zbGlkZXIiOi0xLCJkZWZlbnNpdmUiOnRydWUsIm1vZF9kbSI6MCwiZGVmX21vZF9kbSI6MCwiZGVmZW5zaXZlX3NlbGVjdCI6WyJCb2R5IFlhdyIsIn4iXSwieWF3X3JpZ2h0IjowLCJmb3JjZV9kZWYiOnRydWUsInlhd19kZWxheSI6MSwiZGVmX2JvZHlfeWF3X3R5cGUiOiJTdGF0aWMiLCJkZWZlbnNpdmVfeWF3IjoiT2ZmIiwiZGVmX21vZF90eXBlIjoiT2ZmIiwieWF3X3ZhbHVlIjo3NywibW9kX3JhbmRvbSI6MCwic3Bpbl9vZmZzZXQiOjM2MCwic3Bpbl9zcGVlZCI6MTAsInBpdGNoX3NwZWVkIjowLCJ5YXdfb3ZlcnJpZGUiOmZhbHNlLCJ5YXdfbGVmdCI6MCwicGl0Y2hfdmFsdWUiOi0zOCwicGl0Y2giOiJEb3duIn0seyJlbmFibGUiOnRydWUsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6Ik9mZiIsInlhd19vZmZzZXQiOjI1LCJwZWVrX2RlZiI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkN1c3RvbSIsImRlbGF5X3JhbmRvbSI6MSwiYm9keV9zbGlkZXIiOjEsImJvZHlfeWF3X3R5cGUiOiJTdGF0aWMiLCJ5YXdfcmFuZG9tIjowLCJkZWZfYm9keV9zbGlkZXIiOjAsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZF9kbSI6MCwiZGVmX21vZF9kbSI6MCwiZGVmZW5zaXZlX3NlbGVjdCI6WyJ+Il0sInlhd19yaWdodCI6MCwiZm9yY2VfZGVmIjpmYWxzZSwieWF3X2RlbGF5IjoxLCJkZWZfYm9keV95YXdfdHlwZSI6Ik9mZiIsImRlZmVuc2l2ZV95YXciOiJPZmZzZXQiLCJkZWZfbW9kX3R5cGUiOiJPZmYiLCJ5YXdfdmFsdWUiOjE3MSwibW9kX3JhbmRvbSI6MCwic3Bpbl9vZmZzZXQiOjM2MCwic3Bpbl9zcGVlZCI6MTAsInBpdGNoX3NwZWVkIjowLCJ5YXdfb3ZlcnJpZGUiOmZhbHNlLCJ5YXdfbGVmdCI6MCwicGl0Y2hfdmFsdWUiOjAsInBpdGNoIjoiRG93biJ9XV0='}}
configs_db.menu_list = configs_db.menu_list or {'Default'}

configs_db.cfg_list[1][2] = "W3sidmlzdWFscyI6eyJkZWZlbnNpdmVfd2luZG93X3R5cGUiOiJNb2Rlcm4iLCJjcm9zc19jb2xvciI6dHJ1ZSwiZGVmZW5zaXZlX3dpbmRvd19jIjoiI0ZGRkZGRkZGIiwicmFnZWJvdF9sb2dzIjpbIkNvbnNvbGUiLCJTY3JlZW4iLCJ+Il0sInJhZ2Vib3RfbG9nc19taXNzIjoiI0JENjM2MEZGIiwiY3Jvc3NfY29sb3JfYyI6IiM2NDY0NjRGRiIsInJhZ2Vib3RfbG9nc19oaXQiOiIjNzRCRDYwRkYiLCJjcm9zc19pbmQiOnRydWUsImNyb3NzX2luZF9jIjoiI0M4QzhDOEZGIiwia2V5X2NvbG9yIjp0cnVlLCJ2ZWxvY2l0eV93aW5kb3dfYyI6IiNGRkZGRkZGRiIsImtleV9jb2xvcl9jIjoiI0ZGRkZGRkZGIiwiY3Jvc3NfaW5kX3R5cGUiOiJEZWZhdWx0IiwiZGVmZW5zaXZlX3dpbmRvdyI6dHJ1ZSwidmVsb2NpdHlfd2luZG93X3R5cGUiOiJNb2Rlcm4iLCJ2ZWxvY2l0eV93aW5kb3ciOnRydWV9LCJtaXNjIjp7InByZWRpY3QiOnRydWUsImZhc3RfbGFkZGVyIjp0cnVlLCJ1bnNhZmVfcmVjaGFyZ2UiOnRydWUsInVuc2FmZV90eXBlIjoiQWx0ZXJuYXRpdmUiLCJhc3BlY3RyYXRpbyI6dHJ1ZSwiYWlycXNiaW5kIjpbMSw1LCJ+Il0sImNvbnNvbGUiOnRydWUsImFzcGVjdHJhdGlvX3ZhbHVlIjoxMzMsImRlZmVuc2l2ZV9maXgiOnRydWUsImFpcnFzIjp0cnVlLCJ0aGlyZF9wZXJzb24iOnRydWUsImFudGliYWNrc3RhYiI6dHJ1ZSwidGhpcmRfcGVyc29uX3ZhbHVlIjo0NX0sIm1haW4iOnsidGFiIjoiQ29uZmlnIn0sImFudGlhaW0iOnsidGFiIjoiQnVpbGRlciIsImRlZmVuc2l2ZV9jb25kaXRpb24iOlsifiJdLCJ5YXdfb3B0aW9ucyI6WyJEaXNhYmxlIFlhdyBNb2RpZmllciIsIn4iXSwia2V5X2xlZnQiOlsxLDkwLCJ+Il0sInNhZmVfaGVhZCI6WyJBaXIrQyBLbmlmZSIsIkFpcitDIFpldXMiLCJIZWlnaHQgRGlmZmVyZW5jZSIsIn4iXSwiZnJfb3B0aW9ucyI6WyJ+Il0sImZyX2Rpc2FibGVycyI6WyJXYWxraW5nIiwiQ3JvdWNoIiwiQWlyIiwifiJdLCJhYV9vdmVycmlkZSI6WyJ+Il0sInlhd19iYXNlIjoiTG9jYWwgdmlldyIsImVkZ2VfeWF3IjpbMSwwLCJ+Il0sImtleV9mb3J3YXJkIjpbMSwwLCJ+Il0sIm1hbnVhbF9kaXJlY3Rpb24iOnRydWUsImhlaWdodF9kaWZmZXJlbmNlIjoyMDAsImNvbmRpdGlvbiI6IkxlZ2l0IEFBIiwieWF3X2RpcmVjdGlvbiI6dHJ1ZSwiZGVmZW5zaXZlX3RyaWdnZXJzIjpbIn4iXSwiZnJlZXN0YW5kaW5nIjpbMSwwLCJ+Il0sImtleV9yaWdodCI6WzEsNjcsIn4iXX0sImNvbmZpZyI6eyJsaXN0Ijo0LCJuYW1lIjoia3cifX0sW3siZW5hYmxlIjpmYWxzZSwiZGVmX21vZF9yYW5kb20iOjAsIm1vZF90eXBlIjoiT2ZmIiwieWF3X29mZnNldCI6MCwicGVla19kZWYiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmYiLCJkZWxheV9yYW5kb20iOjEsImJvZHlfc2xpZGVyIjowLCJib2R5X3lhd190eXBlIjoiT2ZmIiwieWF3X3JhbmRvbSI6MCwiZGVmX2JvZHlfc2xpZGVyIjowLCJkZWZlbnNpdmUiOmZhbHNlLCJtb2RfZG0iOjAsImRlZl9tb2RfZG0iOjAsImRlZmVuc2l2ZV9zZWxlY3QiOlsifiJdLCJ5YXdfcmlnaHQiOjAsImZvcmNlX2RlZiI6ZmFsc2UsInlhd19kZWxheSI6MSwiZGVmX2JvZHlfeWF3X3R5cGUiOiJPZmYiLCJkZWZlbnNpdmVfeWF3IjoiT2ZmIiwiZGVmX21vZF90eXBlIjoiT2ZmIiwieWF3X3ZhbHVlIjowLCJtb2RfcmFuZG9tIjowLCJzcGluX29mZnNldCI6MzYwLCJzcGluX3NwZWVkIjoxMCwicGl0Y2hfc3BlZWQiOjAsInlhd19vdmVycmlkZSI6ZmFsc2UsInlhd19sZWZ0IjowLCJwaXRjaF92YWx1ZSI6MCwicGl0Y2giOiJEb3duIn0seyJlbmFibGUiOnRydWUsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6IkNlbnRlciIsInlhd19vZmZzZXQiOjMsInBlZWtfZGVmIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiT2ZmIiwiZGVsYXlfcmFuZG9tIjo0LCJib2R5X3NsaWRlciI6MSwiYm9keV95YXdfdHlwZSI6IkppdHRlciIsInlhd19yYW5kb20iOjAsImRlZl9ib2R5X3NsaWRlciI6MSwiZGVmZW5zaXZlIjpmYWxzZSwibW9kX2RtIjotMTgsImRlZl9tb2RfZG0iOi01MCwiZGVmZW5zaXZlX3NlbGVjdCI6WyJKaXR0ZXIiLCJCb2R5IFlhdyIsIn4iXSwieWF3X3JpZ2h0IjowLCJmb3JjZV9kZWYiOmZhbHNlLCJ5YXdfZGVsYXkiOjIsImRlZl9ib2R5X3lhd190eXBlIjoiSml0dGVyIiwiZGVmZW5zaXZlX3lhdyI6Ik9mZnNldCIsImRlZl9tb2RfdHlwZSI6IlNraXR0ZXIiLCJ5YXdfdmFsdWUiOjMsIm1vZF9yYW5kb20iOjAsInNwaW5fb2Zmc2V0IjozNjAsInNwaW5fc3BlZWQiOjEwLCJwaXRjaF9zcGVlZCI6MSwieWF3X292ZXJyaWRlIjpmYWxzZSwieWF3X2xlZnQiOjAsInBpdGNoX3ZhbHVlIjo4OSwicGl0Y2giOiJEb3duIn0seyJlbmFibGUiOnRydWUsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6IlNraXR0ZXIiLCJ5YXdfb2Zmc2V0IjozLCJwZWVrX2RlZiI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkN1c3RvbSIsImRlbGF5X3JhbmRvbSI6MSwiYm9keV9zbGlkZXIiOjEsImJvZHlfeWF3X3R5cGUiOiJKaXR0ZXIiLCJ5YXdfcmFuZG9tIjowLCJkZWZfYm9keV9zbGlkZXIiOjAsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZF9kbSI6LTQwLCJkZWZfbW9kX2RtIjotNjUsImRlZmVuc2l2ZV9zZWxlY3QiOlsiSml0dGVyIiwiQm9keSBZYXciLCJ+Il0sInlhd19yaWdodCI6MCwiZm9yY2VfZGVmIjpmYWxzZSwieWF3X2RlbGF5IjoxLCJkZWZfYm9keV95YXdfdHlwZSI6Ik9wcG9zaXRlIiwiZGVmZW5zaXZlX3lhdyI6IkZsaWNrIiwiZGVmX21vZF90eXBlIjoiT2ZmIiwieWF3X3ZhbHVlIjo5MCwibW9kX3JhbmRvbSI6MCwic3Bpbl9vZmZzZXQiOjM2MCwic3Bpbl9zcGVlZCI6MTAsInBpdGNoX3NwZWVkIjoyLCJ5YXdfb3ZlcnJpZGUiOmZhbHNlLCJ5YXdfbGVmdCI6MCwicGl0Y2hfdmFsdWUiOi0yNiwicGl0Y2giOiJEb3duIn0seyJlbmFibGUiOnRydWUsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6IkNlbnRlciIsInlhd19vZmZzZXQiOi0yLCJwZWVrX2RlZiI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6Ik9mZiIsImRlbGF5X3JhbmRvbSI6MSwiYm9keV9zbGlkZXIiOjEsImJvZHlfeWF3X3R5cGUiOiJKaXR0ZXIiLCJ5YXdfcmFuZG9tIjowLCJkZWZfYm9keV9zbGlkZXIiOjAsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZF9kbSI6NTMsImRlZl9tb2RfZG0iOi01MCwiZGVmZW5zaXZlX3NlbGVjdCI6WyJKaXR0ZXIiLCJ+Il0sInlhd19yaWdodCI6MywiZm9yY2VfZGVmIjpmYWxzZSwieWF3X2RlbGF5IjoyLCJkZWZfYm9keV95YXdfdHlwZSI6Ik9mZiIsImRlZmVuc2l2ZV95YXciOiJPZmZzZXQiLCJkZWZfbW9kX3R5cGUiOiJTa2l0dGVyIiwieWF3X3ZhbHVlIjozLCJtb2RfcmFuZG9tIjowLCJzcGluX29mZnNldCI6MzYwLCJzcGluX3NwZWVkIjoxMCwicGl0Y2hfc3BlZWQiOjAsInlhd19vdmVycmlkZSI6ZmFsc2UsInlhd19sZWZ0IjozLCJwaXRjaF92YWx1ZSI6MCwicGl0Y2giOiJEb3duIn0seyJlbmFibGUiOnRydWUsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6IkNlbnRlciIsInlhd19vZmZzZXQiOjAsInBlZWtfZGVmIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiQ3VzdG9tIiwiZGVsYXlfcmFuZG9tIjo2LCJib2R5X3NsaWRlciI6MSwiYm9keV95YXdfdHlwZSI6IkppdHRlciIsInlhd19yYW5kb20iOjAsImRlZl9ib2R5X3NsaWRlciI6MSwiZGVmZW5zaXZlIjpmYWxzZSwibW9kX2RtIjo1MywiZGVmX21vZF9kbSI6LTUxLCJkZWZlbnNpdmVfc2VsZWN0IjpbIkppdHRlciIsIkJvZHkgWWF3IiwifiJdLCJ5YXdfcmlnaHQiOjMsImZvcmNlX2RlZiI6ZmFsc2UsInlhd19kZWxheSI6MiwiZGVmX2JvZHlfeWF3X3R5cGUiOiJPcHBvc2l0ZSIsImRlZmVuc2l2ZV95YXciOiJGbGljayIsImRlZl9tb2RfdHlwZSI6Ik9mZiIsInlhd192YWx1ZSI6OTAsIm1vZF9yYW5kb20iOjAsInNwaW5fb2Zmc2V0IjozNjAsInNwaW5fc3BlZWQiOjEwLCJwaXRjaF9zcGVlZCI6LTEsInlhd19vdmVycmlkZSI6ZmFsc2UsInlhd19sZWZ0IjozLCJwaXRjaF92YWx1ZSI6LTQyLCJwaXRjaCI6IkRvd24ifSx7ImVuYWJsZSI6dHJ1ZSwiZGVmX21vZF9yYW5kb20iOjAsIm1vZF90eXBlIjoiQ2VudGVyIiwieWF3X29mZnNldCI6MTEsInBlZWtfZGVmIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiU3BpbiIsImRlbGF5X3JhbmRvbSI6MSwiYm9keV9zbGlkZXIiOjEsImJvZHlfeWF3X3R5cGUiOiJKaXR0ZXIiLCJ5YXdfcmFuZG9tIjo2LCJkZWZfYm9keV9zbGlkZXIiOjEsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZF9kbSI6NjIsImRlZl9tb2RfZG0iOi01MSwiZGVmZW5zaXZlX3NlbGVjdCI6WyJKaXR0ZXIiLCJCb2R5IFlhdyIsIn4iXSwieWF3X3JpZ2h0IjoxMCwiZm9yY2VfZGVmIjpmYWxzZSwieWF3X2RlbGF5IjoxLCJkZWZfYm9keV95YXdfdHlwZSI6Ik9wcG9zaXRlIiwiZGVmZW5zaXZlX3lhdyI6IlNpZGV+V2F5cyIsImRlZl9tb2RfdHlwZSI6Ik9mZiIsInlhd192YWx1ZSI6MTU2LCJtb2RfcmFuZG9tIjowLCJzcGluX29mZnNldCI6MzYwLCJzcGluX3NwZWVkIjoxMCwicGl0Y2hfc3BlZWQiOjQsInlhd19vdmVycmlkZSI6ZmFsc2UsInlhd19sZWZ0IjoxMSwicGl0Y2hfdmFsdWUiOjg5LCJwaXRjaCI6IkRvd24ifSx7ImVuYWJsZSI6dHJ1ZSwiZGVmX21vZF9yYW5kb20iOjEwLCJtb2RfdHlwZSI6IkNlbnRlciIsInlhd19vZmZzZXQiOjYsInBlZWtfZGVmIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiQ3VzdG9tIiwiZGVsYXlfcmFuZG9tIjoxLCJib2R5X3NsaWRlciI6MSwiYm9keV95YXdfdHlwZSI6IkppdHRlciIsInlhd19yYW5kb20iOjEyLCJkZWZfYm9keV9zbGlkZXIiOjEsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZF9kbSI6NTUsImRlZl9tb2RfZG0iOjAsImRlZmVuc2l2ZV9zZWxlY3QiOlsiSml0dGVyIiwiQm9keSBZYXciLCJ+Il0sInlhd19yaWdodCI6NywiZm9yY2VfZGVmIjpmYWxzZSwieWF3X2RlbGF5IjoxLCJkZWZfYm9keV95YXdfdHlwZSI6IlN0YXRpYyIsImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmX21vZF90eXBlIjoiT2ZmIiwieWF3X3ZhbHVlIjoxODAsIm1vZF9yYW5kb20iOjEwLCJzcGluX29mZnNldCI6MzYwLCJzcGluX3NwZWVkIjo5LCJwaXRjaF9zcGVlZCI6MCwieWF3X292ZXJyaWRlIjpmYWxzZSwieWF3X2xlZnQiOjcsInBpdGNoX3ZhbHVlIjotODksInBpdGNoIjoiRG93biJ9LHsiZW5hYmxlIjp0cnVlLCJkZWZfbW9kX3JhbmRvbSI6MTAsIm1vZF90eXBlIjoiQ2VudGVyIiwieWF3X29mZnNldCI6NiwicGVla19kZWYiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJDdXN0b20iLCJkZWxheV9yYW5kb20iOjEsImJvZHlfc2xpZGVyIjoxLCJib2R5X3lhd190eXBlIjoiSml0dGVyIiwieWF3X3JhbmRvbSI6MTMsImRlZl9ib2R5X3NsaWRlciI6LTEsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZF9kbSI6NTAsImRlZl9tb2RfZG0iOjAsImRlZmVuc2l2ZV9zZWxlY3QiOlsiSml0dGVyIiwiQm9keSBZYXciLCJ+Il0sInlhd19yaWdodCI6MjIsImZvcmNlX2RlZiI6ZmFsc2UsInlhd19kZWxheSI6MSwiZGVmX2JvZHlfeWF3X3R5cGUiOiJTdGF0aWMiLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZl9tb2RfdHlwZSI6Ik9mZiIsInlhd192YWx1ZSI6MTgwLCJtb2RfcmFuZG9tIjoxMCwic3Bpbl9vZmZzZXQiOjM2MCwic3Bpbl9zcGVlZCI6NSwicGl0Y2hfc3BlZWQiOjAsInlhd19vdmVycmlkZSI6ZmFsc2UsInlhd19sZWZ0IjowLCJwaXRjaF92YWx1ZSI6LTg5LCJwaXRjaCI6IkRvd24ifSx7ImVuYWJsZSI6ZmFsc2UsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6Ik9mZiIsInlhd19vZmZzZXQiOjAsInBlZWtfZGVmIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiT2ZmIiwiZGVsYXlfcmFuZG9tIjoxLCJib2R5X3NsaWRlciI6MCwiYm9keV95YXdfdHlwZSI6Ik9mZiIsInlhd19yYW5kb20iOjAsImRlZl9ib2R5X3NsaWRlciI6MCwiZGVmZW5zaXZlIjpmYWxzZSwibW9kX2RtIjowLCJkZWZfbW9kX2RtIjowLCJkZWZlbnNpdmVfc2VsZWN0IjpbIn4iXSwieWF3X3JpZ2h0IjowLCJmb3JjZV9kZWYiOmZhbHNlLCJ5YXdfZGVsYXkiOjEsImRlZl9ib2R5X3lhd190eXBlIjoiT2ZmIiwiZGVmZW5zaXZlX3lhdyI6Ik9mZiIsImRlZl9tb2RfdHlwZSI6Ik9mZiIsInlhd192YWx1ZSI6MCwibW9kX3JhbmRvbSI6MCwic3Bpbl9vZmZzZXQiOjM2MCwic3Bpbl9zcGVlZCI6MTAsInBpdGNoX3NwZWVkIjowLCJ5YXdfb3ZlcnJpZGUiOmZhbHNlLCJ5YXdfbGVmdCI6MCwicGl0Y2hfdmFsdWUiOjAsInBpdGNoIjoiT2ZmIn0seyJlbmFibGUiOnRydWUsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6Ik9mZiIsInlhd19vZmZzZXQiOjE4MCwicGVla19kZWYiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmYiLCJkZWxheV9yYW5kb20iOjEsImJvZHlfc2xpZGVyIjowLCJib2R5X3lhd190eXBlIjoiSml0dGVyIiwieWF3X3JhbmRvbSI6MCwiZGVmX2JvZHlfc2xpZGVyIjowLCJkZWZlbnNpdmUiOmZhbHNlLCJtb2RfZG0iOjEwNiwiZGVmX21vZF9kbSI6MCwiZGVmZW5zaXZlX3NlbGVjdCI6WyJ+Il0sInlhd19yaWdodCI6MCwiZm9yY2VfZGVmIjpmYWxzZSwieWF3X2RlbGF5IjoxLCJkZWZfYm9keV95YXdfdHlwZSI6Ik9mZiIsImRlZmVuc2l2ZV95YXciOiJPZmYiLCJkZWZfbW9kX3R5cGUiOiJPZmYiLCJ5YXdfdmFsdWUiOjAsIm1vZF9yYW5kb20iOjAsInNwaW5fb2Zmc2V0IjozNjAsInNwaW5fc3BlZWQiOjEwLCJwaXRjaF9zcGVlZCI6MCwieWF3X292ZXJyaWRlIjpmYWxzZSwieWF3X2xlZnQiOjAsInBpdGNoX3ZhbHVlIjowLCJwaXRjaCI6Ik9mZiJ9LHsiZW5hYmxlIjp0cnVlLCJkZWZfbW9kX3JhbmRvbSI6MCwibW9kX3R5cGUiOiJPZmYiLCJ5YXdfb2Zmc2V0Ijo1LCJwZWVrX2RlZiI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkN1c3RvbSIsImRlbGF5X3JhbmRvbSI6MSwiYm9keV9zbGlkZXIiOjEsImJvZHlfeWF3X3R5cGUiOiJTdGF0aWMiLCJ5YXdfcmFuZG9tIjowLCJkZWZfYm9keV9zbGlkZXIiOi0xLCJkZWZlbnNpdmUiOnRydWUsIm1vZF9kbSI6MCwiZGVmX21vZF9kbSI6MCwiZGVmZW5zaXZlX3NlbGVjdCI6WyJCb2R5IFlhdyIsIn4iXSwieWF3X3JpZ2h0IjowLCJmb3JjZV9kZWYiOnRydWUsInlhd19kZWxheSI6MSwiZGVmX2JvZHlfeWF3X3R5cGUiOiJTdGF0aWMiLCJkZWZlbnNpdmVfeWF3IjoiT2ZmIiwiZGVmX21vZF90eXBlIjoiT2ZmIiwieWF3X3ZhbHVlIjo3NywibW9kX3JhbmRvbSI6MCwic3Bpbl9vZmZzZXQiOjM2MCwic3Bpbl9zcGVlZCI6MTAsInBpdGNoX3NwZWVkIjowLCJ5YXdfb3ZlcnJpZGUiOmZhbHNlLCJ5YXdfbGVmdCI6MCwicGl0Y2hfdmFsdWUiOi0zOCwicGl0Y2giOiJEb3duIn0seyJlbmFibGUiOnRydWUsImRlZl9tb2RfcmFuZG9tIjowLCJtb2RfdHlwZSI6Ik9mZiIsInlhd19vZmZzZXQiOjI1LCJwZWVrX2RlZiI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkN1c3RvbSIsImRlbGF5X3JhbmRvbSI6MSwiYm9keV9zbGlkZXIiOjEsImJvZHlfeWF3X3R5cGUiOiJTdGF0aWMiLCJ5YXdfcmFuZG9tIjowLCJkZWZfYm9keV9zbGlkZXIiOjAsImRlZmVuc2l2ZSI6ZmFsc2UsIm1vZF9kbSI6MCwiZGVmX21vZF9kbSI6MCwiZGVmZW5zaXZlX3NlbGVjdCI6WyJ+Il0sInlhd19yaWdodCI6MCwiZm9yY2VfZGVmIjpmYWxzZSwieWF3X2RlbGF5IjoxLCJkZWZfYm9keV95YXdfdHlwZSI6Ik9mZiIsImRlZmVuc2l2ZV95YXciOiJPZmZzZXQiLCJkZWZfbW9kX3R5cGUiOiJPZmYiLCJ5YXdfdmFsdWUiOjE3MSwibW9kX3JhbmRvbSI6MCwic3Bpbl9vZmZzZXQiOjM2MCwic3Bpbl9zcGVlZCI6MTAsInBpdGNoX3NwZWVkIjowLCJ5YXdfb3ZlcnJpZGUiOmZhbHNlLCJ5YXdfbGVmdCI6MCwicGl0Y2hfdmFsdWUiOjAsInBpdGNoIjoiRG93biJ9XV0="

cfg_system.save_config = function(id)
    if id == 1 then return end
    if configs_db.cfg_list[id] == nil then
        print("Error: config with id "..id.." does not exist.")
        return
    end

    if configs_db.cfg_list[id][2] == nil then
        print("Error: second part of config with id "..id.." does not exist.")
        return
    end
    
    local raw = package:save()
    configs_db.cfg_list[id][2] = base64.encode(json.stringify(raw))
    database.write(lua_db.configs, configs_db)
end


cfg_system.update_values = function(id)
    local name = configs_db.cfg_list[id][1]
    local new_name = name..'\v - Active'
    for k, v in ipairs(configs_db.cfg_list) do
        configs_db.menu_list[k] = v[1]
    end
    configs_db.menu_list[id] = new_name
end

cfg_system.create_config = function(name)
    if type(name) ~= 'string' then return end

    if name == nil or name == '' or name == ' ' then
        print('Wrong Name')
        return
    end

    for i= #configs_db.menu_list, 1, -1 do
        if configs_db.menu_list[i] == name then
            print('Another config has the same name')
            return
        end
    end

    if #configs_db.cfg_list > 9 then
        print('Maximum number of configs: 10')
        return
    end

    local completed = {name, ''}
    table.insert(configs_db.cfg_list, completed)
    table.insert(configs_db.menu_list, name)
    database.write(lua_db.configs, configs_db)
end

cfg_system.remove_config = function(id)
    if id == 1 then return end
    local item = configs_db.cfg_list[id][1]

    for i= #configs_db.cfg_list, 1, -1 do
        if configs_db.cfg_list[i][1] == item then
            table.remove(configs_db.cfg_list, i)
            table.remove(configs_db.menu_list, i)
        end
    end

    database.write(lua_db.configs, configs_db)
end

cfg_system.load_config = function(id)
    if configs_db.cfg_list[id][2] == nil or configs_db.cfg_list[id][2] == '' then
        print("Problem with: "..id.." Config")
        return
    end

    if id > #configs_db.cfg_list then
        print("Problem with: "..id.." Config")
        return
    end

    package:load(json.parse(base64.decode(configs_db.cfg_list[id][2])))
end

lua_menu.config.create:set_callback(function() 
    cfg_system.create_config(lua_menu.config.name:get())
    lua_menu.config.list:update(configs_db.menu_list)
end)

lua_menu.config.load:set_callback(function() 
    cfg_system.update_values(lua_menu.config.list:get() + 1)
    cfg_system.load_config(lua_menu.config.list:get() + 1)
    lua_menu.config.list:update(configs_db.menu_list)
end)

lua_menu.config.save:set_callback(function() 
    cfg_system.save_config(lua_menu.config.list:get() + 1)
end)

lua_menu.config.delete:set_callback(function() 
    cfg_system.remove_config(lua_menu.config.list:get() + 1)
    lua_menu.config.list:update(configs_db.menu_list)
end)

lua_menu.config.import:set_callback(function() 
    package:load(json.parse(base64.decode(clipboard.get())))
end)

lua_menu.config.export:set_callback(function() 
    clipboard.set(base64.encode(json.stringify(package:save())))
end)
lua_menu.config.list:update(configs_db.menu_list)

client.set_event_callback("setup_command", function(cmd)
    aa_setup(cmd)
    if lua_menu.misc.airqsbind:get() and lua_menu.misc.airqs:get() then
        air_qs(cmd)
    end

    if lua_menu.misc.defensive_fix:get() then
        defensive_fix(cmd)
    end

    if lua_menu.misc.unsafe_recharge:get() then
        unsafe_charge(cmd)
    end

    if lua_menu.misc.fast_ladder:get() then
        fastladder(cmd)
    end
end)

client.set_event_callback('paint', function()
    if not entity.is_alive(entity.get_local_player()) then return end
    if lua_menu.visuals.cross_ind:get() then
        screen_indicator()
    end

    ragebot_logs()

    text_fade_animation(899, center[2] - -520, -1, {r=200, g=200, b=200, a=255}, {r=150, g=150, b=150, a=255}, "~ calamity ~", "")
    renderer.text(910 + renderer.measure_text('', '~ calamity ~ '), center[2] - -520, 200, 200, 200, 255, '', 0, '\aB94A4AFF[lua]')

    thirdperson(lua_menu.misc.third_person:get() and lua_menu.misc.third_person_value:get() or nil)
    aspectratio(lua_menu.misc.aspectratio:get() and lua_menu.misc.aspectratio_value:get()/100 or nil)
    if lua_menu.visuals.velocity_window:get() then
        velocity_ind()
    end
    if lua_menu.visuals.defensive_window:get() then
        defensive_ind()
    end

    if lua_menu.misc.airqsbind:get() and lua_menu.misc.airqs:get() then
        renderer.indicator(255, 255, 255, 255, 'Jump Scout')
    end
end)

client.set_event_callback('shutdown', function()
    thirdperson(150)
    aspectratio(0)
    hide_original_menu(true)
    database.write(lua_db.configs, configs_db)
    lol_predict(false)
end)

client.set_event_callback('paint_ui', function()
    hide_original_menu(false)
end)


client.set_event_callback("level_init", function()
    console_filter(lua_menu.misc.console:get())
    alive_players = {}
    logs = {}
    breaker.cmd = 0
    breaker.defensive = 0
    breaker.defensive_check = 0
end)

client.set_event_callback("round_start", function()
    console_filter(lua_menu.misc.console:get())
    alive_players = {}
    logs = {}
    breaker.cmd = 0
    breaker.defensive = 0
    breaker.defensive_check = 0
end)
client.log("Hwid success")
end)
end
}

webhook.Run()
local bit = require'bit'

client.set_event_callback("paint_ui", function()
    if not entity.is_alive(entity.get_local_player()) then return end
    local threat = client.current_threat()
    local target = "unknown"
    if threat then
        target = entity.get_player_name(threat)
    end
    renderer.indicator(240 , 240 , 240 , 240, "Target: " .. target)
end)	
-- local variables for API functions. any changes to the line below will be lost on re-generation
local client_visible, client_eye_position, client_log, client_trace_bullet, entity_get_bounding_box, entity_get_local_player, entity_get_origin, entity_get_player_name, entity_get_player_resource, entity_get_player_weapon, entity_get_prop, entity_is_dormant, entity_is_enemy, globals_curtime, globals_maxplayers, globals_tickcount, math_max, renderer_indicator, string_format, ui_get, ui_new_checkbox, ui_new_hotkey, ui_reference, ui_set_callback, sqrt, unpack, entity_is_alive, plist_get = client.visible, client.eye_position, client.log, client.trace_bullet, entity.get_bounding_box, entity.get_local_player, entity.get_origin, entity.get_player_name, entity.get_player_resource, entity.get_player_weapon, entity.get_prop, entity.is_dormant, entity.is_enemy, globals.curtime, globals.maxplayers, globals.tickcount, math.max, renderer.indicator, string.format, ui.get, ui.new_checkbox, ui.new_hotkey, ui.reference, ui.set_callback, sqrt, unpack, entity.is_alive, plist.get

local ffi = require "ffi"
local vector = require "vector"
local weapons = require "gamesense/csgo_weapons"

local native_GetClientEntity = vtable_bind("client_panorama.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*,int)")
local native_IsWeapon = vtable_thunk(165, "bool(__thiscall*)(void*)")
local native_GetInaccuracy = vtable_thunk(482, "float(__thiscall*)(void*)")


local ref = {
	mindmg = ui_reference("RAGE", "Aimbot", "Minimum damage"),
	dormantEsp = ui_reference("VISUALS", "Player ESP", "Dormant"),
}

local menu = {
	dormant_switch = ui_new_checkbox("RAGE", "Aimbot", "Dormant aimbot"),
	dormant_key = ui_new_hotkey("RAGE", "Aimbot", "Dormant aimbot", true),
	dormant_mindmg = ui.new_slider("RAGE", "Aimbot", "Dormant minimum damage", 0, 100, 10, true),
	dormant_indicator = ui_new_checkbox("RAGE", "Aimbot", "Dormant indicator"),
}

local player_info_prev = {}
local roundStarted = 0

local function modify_velocity(e, goalspeed)
	local minspeed = math.sqrt((e.forwardmove * e.forwardmove) + (e.sidemove * e.sidemove))
	if goalspeed <= 0 or minspeed <= 0 then
		return
	end

	if e.in_duck == 1 then
		goalspeed = goalspeed * 2.94117647
	end

	if minspeed <= goalspeed then
		return
	end

	local speedfactor = goalspeed / minspeed
	e.forwardmove = e.forwardmove * speedfactor
	e.sidemove = e.sidemove * speedfactor
end

local function on_setup_command(cmd)
	if not ui_get(menu.dormant_switch) then
		return
	end

	local lp = entity_get_local_player()

	local my_weapon = entity_get_player_weapon(lp)
	if not my_weapon then
		return
	end

	local ent = native_GetClientEntity(my_weapon)
	if ent == nil or not native_IsWeapon(ent) then
		return
	end

	local inaccuracy = native_GetInaccuracy(ent)
	if inaccuracy == nil then
		return
	end

	local tickcount = globals_tickcount()
	local player_resource = entity_get_player_resource()
	local eyepos = vector(client_eye_position())
	local simtime = entity_get_prop(lp, "m_flSimulationTime")
	local weapon = weapons(my_weapon)
	local scoped = entity_get_prop(lp, "m_bIsScoped") == 1
	local onground = bit.band(entity_get_prop(lp, 'm_fFlags'), bit.lshift(1, 0))
	if tickcount < roundStarted then return end -- to prevent shooting at ghost dormant esp @ the beginning of round

	local can_shoot
	if weapon.is_revolver then -- for some reason can_shoot returns always false with r8 despite all 3 props being true, no idea why
		can_shoot = simtime > entity_get_prop(my_weapon, "m_flNextPrimaryAttack") -- doing this fixes it ><
	elseif weapon.is_melee_weapon then
		can_shoot = false
	else
		can_shoot = simtime > math_max(entity_get_prop(lp, "m_flNextAttack"), entity_get_prop(my_weapon, "m_flNextPrimaryAttack"), entity_get_prop(my_weapon, "m_flNextSecondaryAttack"))
	end

	-- new player info
	local player_info = {}

	-- loop through all players and continue if they're connected
	for player=1, globals_maxplayers() do
		if entity_get_prop(player_resource, "m_bConnected", player) == 1 then
			if plist_get(player, "Add to whitelist") then goto skip end
			if entity_is_dormant(player) and entity_is_enemy(player) then
				local can_hit

				local origin = vector(entity_get_origin(player))
				local x1, y1, x2, y2, alpha_multiplier = entity_get_bounding_box(player) -- grab alpha of the dormant esp
				
				if player_info_prev[player] ~= nil and origin.x ~= 0 and alpha_multiplier > 0 then -- if origin / dormant esp is valid
					local old_origin, old_alpha, old_hittable = unpack(player_info_prev[player])

					-- update check
					local dormant_accurate = alpha_multiplier > 0.795 -- for debug purposes lower this to 0.1

					if dormant_accurate then
						local target = origin + vector(0, 0, 40)
						local pitch, yaw = eyepos:to(target):angles()
						local ent, dmg = client_trace_bullet(lp, eyepos.x, eyepos.y, eyepos.z, target.x, target.y, target.z, true)

						can_hit = (dmg > ui_get(menu.dormant_mindmg)) and (not client_visible(target.x, target.y, target.z)) -- added visibility check to mitigate shooting at anomalies?
						if can_shoot and can_hit and ui_get(menu.dormant_key) then
							modify_velocity(cmd, (scoped and weapon.max_player_speed_alt or weapon.max_player_speed)*0.33)

							-- autoscope
							if not scoped and weapon.type == "sniperrifle" and cmd.in_jump == 0 and onground == 1 then
								cmd.in_attack2 = 1
							end
							
							if inaccuracy < 0.009 and cmd.chokedcommands == 0 then
								cmd.pitch = pitch
								cmd.yaw = yaw
								cmd.in_attack = 1

								-- dont shoot again
								can_shoot = false
								--client_log(string_format('Taking a shot at: %s | tickcount: %d | predcited damage: %d | inaccuracy: %.3f | Alpha: %.3f', entity.get_player_name(player), tickcount, dmg, inaccuracy, alpha_multiplier))
							end
						end
					end
				end
				player_info[player] = {origin, alpha_multiplier, can_hit}
			end
		end
		::skip::
	end
	player_info_prev = player_info
end

client.register_esp_flag("DORMANT AIMBOT", 255, 255, 255, function(player)
	if ui.get(menu.dormant_switch) and entity.is_enemy(player) and player_info_prev[player] ~= nil and entity.is_alive(entity_get_local_player()) then
		local _, _, can_hit = unpack(player_info_prev[player])

		return can_hit
	end
end)
local function painter()
	if not entity_is_alive(entity_get_local_player()) then return end -- dont draw if dead :lowiqq:
	if ui_get(menu.dormant_switch) and ui_get(menu.dormant_key) and ui_get(menu.dormant_indicator) then
		local colors = {240,240,240,240}
		for k, v in pairs(player_info_prev) do 
			if k ~= nil then 
				if v[3] == true then 
					colors = {240,240,240,240}
					break
				end
			end
		end
		renderer_indicator(colors[1],colors[2],colors[3],colors[4], "DORMANT AIMBOT")
	end
end
local function resetter()
	local freezetime = (cvar.mp_freezetime:get_float()+1) / globals.tickinterval() -- get freezetime plus 1 second and disable dormantbob for that amount of ticks
	roundStarted = globals_tickcount() + freezetime
end

ui_set_callback(menu.dormant_switch, function()
	local czechbox = ui_get(menu.dormant_switch)
	local update_callback = czechbox and client.set_event_callback or client.unset_event_callback

	if czechbox then ui.set(ref.dormantEsp, czechbox) end -- enable dormant ESP on ui toggle ( dumb proofing )
	update_callback("setup_command", on_setup_command)
	update_callback("paint", painter)
	update_callback("round_prestart", resetter)
	ui.set_visible(menu.dormant_indicator, ui_get(menu.dormant_switch))
	ui.set_visible(menu.dormant_mindmg, ui_get(menu.dormant_switch))
end)
ui.set(menu.dormant_indicator, true)
ui.set_visible(menu.dormant_indicator, ui_get(menu.dormant_switch)) -- yes
ui.set_visible(menu.dormant_mindmg, ui_get(menu.dormant_switch)) -- yes^2

local ffi = require 'ffi'

local tab, container = "Rage", "Other"

local current = {
    check_access = true,
}

ffi.cdef [[
    struct animation_layer_t {
		bool m_bClientBlend;		 //0x0000
		float m_flBlendIn;			 //0x0004
		void* m_pStudioHdr;			 //0x0008
		int m_nDispatchSequence;     //0x000C
		int m_nDispatchSequence_2;   //0x0010
		uint32_t m_nOrder;           //0x0014
		uint32_t m_nSequence;        //0x0018
		float m_flPrevCycle;       //0x001C
		float m_flWeight;          //0x0020
		float m_flWeightDeltaRate; //0x0024
		float m_flPlaybackRate;    //0x0028
		float m_flCycle;           //0x002C
		void* m_pOwner;              //0x0030
		char pad_0038[4];            //0x0034
    };
    struct c_animstate { 
        char pad[ 3 ];
        char m_bForceWeaponUpdate; //0x4
        char pad1[ 91 ];
        void* m_pBaseEntity; //0x60
        void* m_pActiveWeapon; //0x64
        void* m_pLastActiveWeapon; //0x68
        float m_flPrevCycle; //0x001C
        float m_flWeight; //0x0020
        float m_flWeightDeltaRate; //0x0024
        float m_flPlaybackRate; //0x0028
        float m_flLastClientSideAnimationUpdateTime; //0x6C
        int m_iLastClientSideAnimationUpdateFramecount; //0x70
        float m_flAnimUpdateDelta; //0x74
        float m_flEyeYaw; //0x78
        float m_flPitch; //0x7C
        float m_flGoalFeetYaw; //0x80
        float m_flCurrentFeetYaw; //0x84   
        float m_flCurrentTorsoYaw; //0x88
        float m_flUnknownVelocityLean; //0x8C
        float m_flLeanAmount; //0x90
        char pad2[ 4 ];
        float m_flFeetCycle; //0x98
        float m_flFeetYawRate; //0x9C
        char pad3[ 4 ];
        float m_fDuckAmount; //0xA4
        float m_fLandingDuckAdditiveSomething; //0xA8
        char pad4[ 4 ];
        float m_vOriginX; //0xB0
        float m_vOriginY; //0xB4
        float m_vOriginZ; //0xB8
        float m_vLastOriginX; //0xBC
        float m_vLastOriginY; //0xC0
        float m_vLastOriginZ; //0xC4
        float m_vVelocityX; //0xC8
        float m_vVelocityY; //0xCC
        char pad5[ 4 ];
        float m_flUnknownFloat1; //0xD4
        char pad6[ 8 ];
        float m_flUnknownFloat2; //0xE0
        float m_flUnknownFloat3; //0xE4
        float m_flUnknown; //0xE8
        float m_flSpeed2D; //0xEC
        float m_flUpVelocity; //0xF0
        float m_flSpeedNormalized; //0xF4
        float m_flFeetSpeedForwardsOrSideWays; //0xF8
        float m_flFeetSpeedUnknownForwardOrSideways; //0xFC
        float m_flTimeSinceStartedMoving; //0x100
        float m_flTimeSinceStoppedMoving; //0x104
        bool m_bOnGround; //0x108
        bool m_bInHitGroundAnimation; //0x109
        float m_flTimeSinceInAir; //0x10A
        float m_flLastOriginZ; //0x10E
        float m_flHeadHeightOrOffsetFromHittingGroundAnimation; //0x112
        float m_flStopToFullRunningFraction; //0x116
        char pad7[ 4 ]; //0x11A
        float m_flMagicFraction; //0x11E
        char pad8[ 60 ]; //0x122
        float m_flWorldForce; //0x15E
        char pad9[ 462 ]; //0x162
        float m_flMaxYaw; //0x334
        float m_flMinYaw; //0x330
    };
]]

local classptr = ffi.typeof('void***')
local rawientitylist = client.create_interface('client.dll', 'VClientEntityList003') or
                           error('VClientEntityList003 wasnt found', 2)

local ientitylist = ffi.cast(classptr, rawientitylist) or error('rawientitylist is nil', 2)
local get_client_networkable = ffi.cast('void*(__thiscall*)(void*, int)', ientitylist[0][0]) or
                                   error('get_client_networkable_t is nil', 2)
local get_client_entity = ffi.cast('void*(__thiscall*)(void*, int)', ientitylist[0][3]) or
                              error('get_client_entity is nil', 2)

local rawivmodelinfo = client.create_interface('engine.dll', 'VModelInfoClient004')
local ivmodelinfo = ffi.cast(classptr, rawivmodelinfo) or error('rawivmodelinfo is nil', 2)
local get_studio_model = ffi.cast('void*(__thiscall*)(void*, const void*)', ivmodelinfo[0][32])


local misc = {
    enable = ui.new_checkbox(tab, container, "Cala\a9FCA2BFFMity"),
    type = ui.new_combobox(tab, container, "Type", {"Default", "Jitter", "Alternative", "Custom"}),
    delta = ui.new_slider(tab, container, 'Delta', 1, 10, 3, true, "°")
}

local function NormalizeAngle(angle)
    while angle > 180 do
        angle = angle - 360
    end

    while angle < -180 do
        angle = angle + 360
    end

    return angle
end

local function GetAnimationState(player)
    if not (player) then
        return
    end
    local player_ptr = ffi.cast("void***", get_client_entity(ientitylist, player))
    local animstate_ptr = ffi.cast("char*", player_ptr) + 0x9960
    local state = ffi.cast("struct c_animstate**", animstate_ptr)[0]
    return state
end

local eye_yaw = 1
local ent_name = "none"
local side = -1
local side2 = -1


local function ResolveJitter(player)
    local animstate = GetAnimationState(player)
    local lpent = get_client_entity(ientitylist, player)

    local delta = entity.get_prop(player, "m_angEyeAngles[1]") - entity.get_prop(player, "m_flPoseParameter", 11)

    eye_yaw = animstate.m_flEyeYaw

    ent_name = entity.get_player_name(player)

    local yaws

    local yaw1 = (entity.get_prop(player, "m_flPoseParameter", 11) or 1) * 116 - 58


    side = globals.tickcount() % 2 == 0 and -1 or 1
    side2 = (globals.tickcount() % 3) - 1

    if ui.get(misc.type) == "Default" then
        yaws = delta * yaw1 * animstate.m_flPlaybackRate
    elseif ui.get(misc.type) == "Jitter" then
        yaws = side * math.abs(delta * yaw1 * animstate.m_flPlaybackRate)
    elseif ui.get(misc.type) == "Alternative" then
        yaws = side2 * math.abs(delta * yaw1 * animstate.m_flPlaybackRate)
    else
        yaws = (delta * yaw1 * animstate.m_flPlaybackRate)/ui.get(misc.delta)
    end

    yaws = NormalizeAngle(yaws)

    plist.set(player, "Force body yaw", true)
    plist.set(player, "Force body yaw value", yaws) 
end

local function Resolver(player)
    if ui.get(misc.enable) then
        if entity.is_dormant(player) or entity.get_prop(player, "m_bDormant") then
            return
        end
        ResolveJitter(player)
    else
        plist.set(player, "Force body yaw", false)
    end
end

local function ResolverUpdate()
    if current.check_access == false then return end
    local enemies = entity.get_players(true)
    for i, enemy_ent in ipairs(enemies) do
        if enemy_ent and entity.is_alive(enemy_ent) then
            Resolver(enemy_ent)
        end
    end
end

local x_ind, y_ind = client.screen_size()
local function paint_indicator()
    if current.check_access == false then return end
    if not ui.get(misc.enable) then return end
    if entity.get_local_player() == nil or not entity.is_alive(entity.get_local_player()) then return end
    renderer.text(20, y_ind/2, 255, 255, 255, 255, "", 0, "> Cala\a9FCA2BFFMity \aEE4444FF[Beta]")
    renderer.text(20, y_ind/2+12, 255, 255, 255, 255, "", 0, "> resolver type: \aEE4444FF"..ui.get(misc.type))
    renderer.text(20, y_ind/2+24, 255, 255, 255, 255, "", 0, "> Enemy: \aEE4444FF"..ent_name)
    renderer.text(20, y_ind/2+36, 255, 255, 255, 255, "", 0, "> Eye: \aEE4444FF"..math.floor(eye_yaw))
end



local function visibility()
    ui.set_visible(misc.enable, current.check_access)
    ui.set_visible(misc.type, ui.get(misc.enable) and current.check_access)
    ui.set_visible(misc.delta, ui.get(misc.type) == "Custom" and ui.get(misc.enable) and current.check_access)
end

client.set_event_callback("paint_ui", visibility)
client.set_event_callback("paint", paint_indicator)
client.set_event_callback("setup_command", ResolverUpdate)

local sentences = {
    "$name, 1", 
    "$name бро купи уже calamity.lua хватит падать",
    "get good get calamity.lua",
    "бро чё по аа? calamity.lua the best",
    "бро купи уже у меня луа https://discord.gg/fwfYHDKA",
    "so easy to calamity.lua",
    "🆘 ПОМОГИТЕ ПИДОРАСУ ОН УМЕР ОТ calamity.lua",
    "изи пидор умер на СВО ОТ РУССКИХ ЧТО ХОХОЛ КАК ДЕЛА?",
    "ебанутый сынок шалавы ты че там возомнил блять тупица ты ебанная безмозглая",
    "пидорас хуёвый",
    "я тут тебя кастрирую чисто щенка ебанного",
    "на шампур тебя садил",
    "пидорас",
    "я мать твою ебал",
    "бездарьная ты нахуй прошмандовка ебанная",
    "слабохарактерная ты шалавенция максимально убогая и тупая",
    "ливни уже а то нам с котиками стыдно на тебя бедного смотреть",
    "вагинальная пробка ты че тут забыла",
    "твое место в очке пидарас",
    "становись на колени, будем тебя ебать",
    "ты ряльно думал то что то ты никчемное существо кому-то нужно?",
    "АХХАХАХАХАХАХА ТАК СМЕШНО ПОМЕРЛА МРАЗЬ",
    "Я ТЯ СБИЛ НА СВОЕЙ МАЛЫХЕ",
    "укатилась чурка на инвалидной коляске",
    "пидрила любое твое слово мне в хуяку",
    "хотя ты никчемная тварь, которая облизывает мои сочные яйки",
    "не пытайся победить короля, тупая гнида",
    "тебе до меня как муровью на гору",
    "тьфу пидрила ты такая мелочная дешевле моих трусов",
    "1",    
    "упала слабая хуйня",
    "скит чит рулит а ещё и луа пена",
    "годмоде врубил против пидораса",
    "изи пизи леймон скризи",
    "ангела хуй сосут?",
    "powered by везение",
    "спи шлюшка",
    "pro player 2000",
    "гет гуд иди нахуй",
    " ✦calamity.lua✦ ",
    "отдыхай ржавая хуйня",
    "САНЕЧКА СНИМАЕШЬ БОМЖА?",




	}

local ui = {
    new_checkbox = ui.new_checkbox,
    get = ui.get
}

local client = {
    set_event_callback = client.set_event_callback,
    userid_to_entindex = client.userid_to_entindex,
    exec = client.exec,
    log = client.log
}

local entity = {
    get_local_player = entity.get_local_player,
    get_player_name = entity.get_player_name
}

local killsay_enabled = ui.new_checkbox("LUA", "A", "Enable trashtalk")
local killsayName_enabled = ui.new_checkbox("LUA","A","With name")

local function on_player_death(event)
    if not ui.get(killsay_enabled) then return end

    local local_player = entity.get_local_player()
    local attacker = client.userid_to_entindex(event.attacker)
    local victim = client.userid_to_entindex(event.userid)

    if local_player == nil or attacker == nil or victim == nil then
        return
    end

    if attacker == local_player and victim ~= local_player then
	
		if ui.get(killsayName_enabled) then
		
		local killsay = "say " .. sentences[math.random(#sentences)]
        killsay = string.gsub(killsay, "$name", entity.get_player_name(victim))
        client.log(killsay)
        client.exec(killsay)
		
		else
		
		local killsay = "say " .. sentences[math.random(#sentences)]
        killsay = string.gsub(killsay, "$name,", " ")
        client.log(killsay)
        client.exec(killsay)
		
		end
	end
end
math.randomseed(133742069)
math.random(); math.random(); math.random()

client.set_event_callback("player_death", on_player_death)
