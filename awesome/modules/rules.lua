local awful = require("awful")
local beautiful = require("beautiful")

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    rule_any = {
        instance = {
          "copyq",  -- Includes session name in class.
          "plugin-container",
        },
        class = {
          "Arandr",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "qimgv",
	  "Sxiv",
	  "feh",
          "Wpa_gui",
          "pinentry",
          "veromix",
          "xtightvncviewer"},

        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      , properties = { floating = true }},

     -- Application rules
     { rule = { class = "Firefox" },
       properties = { screen = 1, tag = "www" } },

     { rule = { class = "discord" },
       properties = { screen = 1, tag = "disc" } },

     { rule = { name = "spt" },
       properties = { screen = 1, tag = "spot" } }
}
