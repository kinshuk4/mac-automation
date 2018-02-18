on run
  set date_ to ((current date) as string)
  set the clipboard to the date_
  tell application "Numbers"
    activate
    tell application "System Events"
      keystroke "v" using {option down, shift down, command down}
    end tell
  end tell
end run