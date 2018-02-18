on run {note_name}
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		set note_found to (find notes ("intitle:\"" & note_name & "\""))
		
		if note_found = {} then
			return false
		else if (count of note_found) > 1 then
			return (count of note_found)
		else
			return true
		end if
		
	end tell
	
end run