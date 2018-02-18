-- The fist version used `cmd` and `+`
  --repeat 5 times
    --delay 0.1
    --keystroke "+" using command down
  --end repeat
  --keystroke "b" using command down


-- I tried menu click but is slower than keystroke
  --tell process "Evernote" 
    --click menu item "Bold" of menu 1 of menu item "Style" of menu "Format" of menu bar 1
  --end tell


-- The fast way to increase font size is click the pop menu directly as following code

set appName to "Evernote"

tell application "System Events"
  set activeApp to name of application processes whose frontmost is true
  --Don't execute when active window is not Evernote
  if (activeApp as string) is not equal to appName then
      error number -128
  end if

  tell application process (appName as string)
    set isBold to value of ((checkbox 1 of splitter group 0 of splitter group 0 of window 1) whose description is "Bold") as boolean
    if isBold is false then
      -- Don's know why clicking checkbox not work here, use keystroke temporarily
      --click ((checkbox 1 of splitter group 0 of splitter group 0 of window 1) whose description is "Bold") as boolean
      keystroke "b" using command down
    end if

    click ((pop up button 1 of splitter group 0 of splitter group 0 of window 1) whose name is "Text Size")
    -- 9 is font size 36px
    -- 10 will be font size 48px
    click menu item 9 of menu of pop up button 2 of splitter group 0 of splitter group 0 of window 1
  end tell
end tell
