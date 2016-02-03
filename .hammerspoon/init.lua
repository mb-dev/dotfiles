local mash = {"cmd", "alt", "ctrl"}

hs.hotkey.bind(mash, ',', function() os.execute("open -n -a /Applications/Utilities/Terminal.app/") end)

hs.hotkey.bind(mash, 'Left', function() hs.window.focusedWindow():moveToUnit(hs.layout.left50) end)
hs.hotkey.bind(mash, 'Right', function() hs.window.focusedWindow():moveToUnit(hs.layout.right50) end)
hs.hotkey.bind(mash, 'M', hs.grid.maximizeWindow)
