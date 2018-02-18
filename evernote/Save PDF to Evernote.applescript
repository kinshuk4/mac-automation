tell application "System Events"
    tell (first process whose frontmost is true)
        if exists window 1 then
            keystroke "p" using command down -- shortcut to print
            tell sheet 1 of window 1
                set i to 0
                repeat until exists
                    delay 1
                    set i to i + 1
                    if i > 4 then return -- no print window, exit this script
                end repeat -- sheet opened
                tell menu button "PDF"
                    click
                    delay 0.3
                    click menu item "Save PDF to Evernote" of menu 1
                end tell
                repeat while exists
                    delay 1
                end repeat -- sheet closed
            end tell
        end if
    end tell
end tell