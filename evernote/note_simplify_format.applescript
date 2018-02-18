on run {note_name}
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		set t_note to (find notes ("intitle:\"" & note_name & "\""))
		set t_note to item 1 of t_note
		
		set note_win to open note window with t_note
		delay 0.2
		activate note_win
		
		tell application "System Events"
			
			# Move the cursor to the title
			keystroke "l" using command down
			delay 0.1
			
			# Put Cursor into Text Editor
			key code 48
			delay 0.1
			
			# Select All
			keystroke "a" using command down
			delay 0.2
			
			# Simplify Formatting
			keystroke "f" using {command down, shift down}
			delay 0.4
			
			# Save
			keystroke "s" using command down
			delay 0.8
			
		end tell
		
		close note_win
		
	end tell
	
end run