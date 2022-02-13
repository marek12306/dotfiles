local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local lain = require("lain")

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

spacer = wibox.widget.textbox()
spacer:set_text(" ")

mytextclock = wibox.widget.textclock("%d.%m.%Y  %H:%M")

mycpu = lain.widget.cpu {
    settings = function()
        widget:set_markup("CPU " .. cpu_now.usage .. "%")
    end
}

mybattery = lain.widget.bat {
    battery = "BAT0",
    settings = function()
        widget:set_markup("BAT " .. bat_now.perc .. "%")
    end
}

mymem = lain.widget.mem {
    settings = function()
        widget:set_markup("MEM " .. mem_now.perc .. "%")
    end
}

-- Create a wibox for each screen and add it
taglist_buttons = awful.util.table.join(
          awful.button({ }, 1, function(t) t:view_only() end),
          awful.button({ modkey }, 1, function(t)
                        if client.focus then
                            client.focus:move_to_tag(t)
                        end
                    end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                  if client.focus then
                                      client.focus:toggle_tag(t)
                                  end
                              end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

tasklist_buttons = awful.util.table.join(
          awful.button({ }, 1, function (c)
                        if c == client.focus then
                            c.minimized = true
                        else
                            -- Without this, the following :isvisible()
                            -- makes no sense
                            c.minimized = false
                            if not c:isvisible() and c.first_tag then
                                c.first_tag:view_only()
                            end
                            -- This will also un-minimise the client, if needed
                            client.focus = c
                            c:raise()
                        end
                    end),
                    awful.button({ }, 4, function ()
                                  awful.client.focus.byidx(1)
                              end),
                    awful.button({ }, 5, function ()
                                  awful.client.focus.byidx(-1)
                              end))

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "main", "www", "disc", "spot" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(awful.util.table.join(
              awful.button({ }, 1, function () awful.layout.inc( 1) end),
              awful.button({ }, 3, function () awful.layout.inc(-1) end),
              awful.button({ }, 4, function () awful.layout.inc( 1) end),
              awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacer,
	    wibox.widget.systray(),
            mytextclock,
            spacer,
	    spacer,

            mycpu.widget,
            spacer,
            spacer,

	    mymem.widget,
	    spacer,
	    spacer,

	    mybattery.widget,
            spacer,
            spacer,

            s.mylayoutbox,
        },
    }
end)
