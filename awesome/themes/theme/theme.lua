local gears = require("gears")
local naughty = require("naughty")

theme = {}

theme.font          = "sans 8"

theme.bg_systray    = theme.bg_normal
theme.border_width  = 1

theme.fg_normal = "#DDDDFF"
theme.fg_focus  = "#A4DE02"
theme.fg_urgent = "#CC9393"
theme.bg_normal = "#1A1A1A"
theme.bg_focus  = "#313131"
theme.bg_urgent = "#1A1A1A"

theme.border_normal     = "#3F3F3F"
theme.border_focus      = "#7F7F7F"
theme.border_marked     = "#CC9393"
theme.tasklist_bg_focus = "#1A1A1A"

theme.menu_height = 15
theme.menu_width  = 100

local config = gears.filesystem.get_dir("config")

theme.dir = config .. "/themes/theme"

theme.wallpaper = config .. "/wallpapers/vincent-guth-62V7ntlKgL8-unsplash.jpg"

theme.layout_fairh = theme.dir .. "/layouts/fairhw.png"
theme.layout_fairv = theme.dir .. "/layouts/fairvw.png"
theme.layout_floating  = theme.dir .. "/layouts/floatingw.png"
theme.layout_magnifier = theme.dir .. "/layouts/magnifierw.png"
theme.layout_max = theme.dir .. "/layouts/maxw.png"
theme.layout_fullscreen = theme.dir .. "/layouts/fullscreenw.png"
theme.layout_tilebottom = theme.dir .. "/layouts/tilebottomw.png"
theme.layout_tileleft   = theme.dir .. "/openSUSE/layouts/tileleftw.png"
theme.layout_tile = theme.dir .. "/layouts/tilew.png"
theme.layout_tiletop = theme.dir .. "/layouts/tiletopw.png"
theme.layout_spiral  = theme.dir .. "/layouts/spiralw.png"
theme.layout_dwindle = theme.dir .. "/layouts/dwindlew.png"

theme.icon_theme = "Adwaita"
theme.tasklist_disable_icon = true

return theme
