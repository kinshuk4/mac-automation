-- no activate
-- activate application "QQMusic"
tell application "System Events"
  -- tell application "QQMusic" to activate
  tell process "QQMusic"
    -- click menu item "下一首" of menu "播放控制" of menu bar 1
    perform action "AXPress" of (menu item "下一首" of menu "播放控制" of menu bar 1)
    if visible then
      set visible to false
    end if
  end tell
  -- keystroke tab using {command down}
end tell

(*
-- no activate
tell application "System Events"
  tell group 1 of group 2 of window "QQMusic" of process "QQMusic"
    tell process "QQMusic" to click menu item "下一首" of menu "播放控制" of menu bar 1
    if visible then
      set visible to false
    end if
  end tell
end tell
*)