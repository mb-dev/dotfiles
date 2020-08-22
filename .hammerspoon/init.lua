require 'tabletools'

local mash = {"cmd", "alt", "ctrl"}

-- Monitor names
local display_laptop = "Color LCD"
local display_monitor = "DELL U2415"

local screen_watcher = nil

local units = {
  right30       = { x = 0.70, y = 0.00, w = 0.30, h = 1.00 },
  right70       = { x = 0.30, y = 0.00, w = 0.70, h = 1.00 },
  left70        = { x = 0.00, y = 0.00, w = 0.70, h = 1.00 },
  left30        = { x = 0.00, y = 0.00, w = 0.30, h = 1.00 },
  top50         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50         = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
  upright30     = { x = 0.70, y = 0.00, w = 0.30, h = 0.50 },
  botright30    = { x = 0.70, y = 0.50, w = 0.30, h = 0.50 },
  upleft70      = { x = 0.00, y = 0.00, w = 0.70, h = 0.50 },
  botleft70     = { x = 0.00, y = 0.50, w = 0.70, h = 0.50 },
  top30         = { x = 0.00, y = 0.00, w = 1.00, h = 0.30 },
  middle30      = { x = 0.00, y = 0.30, w = 1.00, h = 0.30 },
  bottomleft30  = { x = 0.00, y = 0.60, w = 0.50, h = 0.30 },
  bottomright30 = { x = 0.50, y = 0.60, w = 0.50, h = 0.30 },
  maximum       = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 }
}

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
hs.hotkey.bind(mash, 'Up', function() hs.window.focusedWindow():moveToUnit(units.top50) end)
hs.hotkey.bind(mash, 'Down', function() hs.window.focusedWindow():moveToUnit(units.bot50) end)
hs.hotkey.bind(mash, '1', function() hs.window.focusedWindow():moveToUnit(units.top30) end)
hs.hotkey.bind(mash, '2', function() hs.window.focusedWindow():moveToUnit(units.middle30) end)
hs.hotkey.bind(mash, '3', function() hs.window.focusedWindow():moveToUnit(units.bottomleft30) end)
hs.hotkey.bind(mash, '4', function() hs.window.focusedWindow():moveToUnit(units.bottomright30) end)
hs.hotkey.bind(mash, 'M', hs.grid.maximizeWindow)

hs.hotkey.bind(mash, ',', function()
    apply_layout()
end)
