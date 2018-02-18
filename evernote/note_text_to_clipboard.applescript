on run {note_name}
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		set t_note to (find notes ("intitle:\"" & note_name & "\""))
		set t_note to item 1 of t_note
		
		set note_win to open note window with t_note
		activate note_win
		
	end tell
	
	tell application "System Events"
		delay 0.1
		
		# Put Cursor into Text Editor
		key code 48
		delay 0.1
		key code 48
		delay 0.1
		
		# Select All
		keystroke "a" using command down
		delay 0.2
		
		# Copy Text to the Clipment
		keystroke "c" using command down
		delay 0.2
		
	end tell
	
	tell application "Evernote"
		
		close note_win
		
	end tell
	
	return the clipboard
	
end run