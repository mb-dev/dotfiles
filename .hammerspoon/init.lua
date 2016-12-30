require 'tabletools'

local mash = {"cmd", "alt", "ctrl"}

-- Monitor names
local display_laptop = "Color LCD"
local display_monitor = "DELL U2415"

local screen_watcher = nil

----------------------
-- System Callbacks --
----------------------

function apply_layout()
    screens = hs.screen.allScreens()
    number_of_screens = #screens
    if number_of_screens == 3 then
      print("Changing layout")
      local windowLayout = {
        {"Firefox", nil, screens[2]:name(), hs.layout.left50, nil, nil},
        {"MacVim", "system--management", screens[3], hs.layout.right50, nil, nil},
        {"MacVim", "dotfiles", screens[3], hs.layout.right50, nil, nil},
        {"iTerm2", nil, screens[3], hs.layout.left50, nil, nil},
        {"Slack", nil, screens[2]:name(), hs.layout.right50, nil, nil},
      }
      hs.layout.apply(windowLayout, string.match)
    end
end


---------------------
-- System Watchers --
---------------------

-- screen_watcher = hs.screen.watcher.new(screens_changed_callback):start()

-------------------------
-- Application Hotkeys --
-------------------------

hs.hotkey.bind(mash, ',', function() os.execute("open -n -a /Applications/Utilities/Terminal.app/") end)

hs.hotkey.bind(mash, 'Left', function() hs.window.focusedWindow():moveToUnit(hs.layout.left50) end)
hs.hotkey.bind(mash, 'Right', function() hs.window.focusedWindow():moveToUnit(hs.layout.right50) end)
hs.hotkey.bind(mash, 'M', hs.grid.maximizeWindow)

hs.hotkey.bind(mash, ',', function()
    apply_layout()
end)
