on run {note_name, text_append}
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		set note_found to (find notes ("intitle:\"" & note_name & "\""))
		
		if 1 = (count of note_found) then
			append (item 1 of note_found) text text_append
			return true
		end if
		
		return false
		
	end tell
	
end run