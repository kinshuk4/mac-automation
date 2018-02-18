on run {note_name, notebook_name}
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		set note_found to find notes "notebook:\"" & notebook_name & "\" intitle:\"" & note_name & "\""
		
		if (count of note_found) = 1 then
			delete item 1 of note_found
			return true
		end if
		
		return false
		
	end tell
	
end run