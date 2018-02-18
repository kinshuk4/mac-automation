on run {note_name}
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		set note_found to (find notes ("intitle:\"" & note_name & "\""))
		
		if 1 = (count of note_found) then
			return HTML content of (item 1 of note_found)
		end if
		
		return false
		
	end tell
	
end run