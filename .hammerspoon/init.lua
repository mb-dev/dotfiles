require 'tabletools'

local mash = {"cmd", "alt", "ctrl"}

-- Monitor names
local display_laptop = "Color LCD"
local display_monitor = "DELL U2415"

local screen_watcher = nil

----------------------
-- System Callbacks --
----------------------

local lastCount = nil
function screens_changed_callback()
    print('screens_changed_callback()')
    screens = hs.screen.allScreens()
    number_of_screens = #screens
    print('number_of_screens:', number_of_screens)
    print(table.show(hs.screen.allScreens(), "allScreens"))
    for _, screen in pairs(hs.screen.allScreens()) do
        print(table.show(screen:currentMode(), "currentMode"))
    end
    for _, application in pairs(hs.application.runningApplications()) do
      print(table.show(application:title()), "applications")
      for _, window in pairs(application:allWindows()) do 
        print(table.show("- " .. window:title(), "applications"))
      end
    end
    if number_of_screens ~= lastCount then
      if number_of_screens == 3 then
        print("Changing layout")
        local windowLayout = {
          {"Firefox", nil, screens[2]:name(), hs.layout.left50, nil, nil},
          {"MacVim", "system--management", screens[3], hs.layout.right50, nil, nil},
          {"MacVim", "dotfiles", screens[3], hs.layout.right50, nil, nil},
          {"iTerm", nil, screens[3], hs.layout.left50, nil, nil},
          {"Slack", nil, screens[2]:name(), hs.layout.right50, nil, nil},
        }
        hs.layout.apply(windowLayout, string.match)
      end
      lastCount = number_of_screens
    end
end


---------------------
-- System Watchers --
---------------------

screen_watcher = hs.screen.watcher.new(screens_changed_callback):start()

-------------------------
-- Application Hotkeys --
-------------------------

hs.hotkey.bind(mash, ',', function() os.execute("open -n -a /Applications/Utilities/Terminal.app/") end)

hs.hotkey.bind(mash, 'Left', function() hs.window.focusedWindow():moveToUnit(hs.layout.left50) end)
hs.hotkey.bind(mash, 'Right', function() hs.window.focusedWindow():moveToUnit(hs.layout.right50) end)
hs.hotkey.bind(mash, 'M', hs.grid.maximizeWindow)

hs.hotkey.bind(mash, ',', function()
    screens_changed_callback()
end)
