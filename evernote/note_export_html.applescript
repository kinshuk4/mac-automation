on run {note_name, html_path}
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		set note_found to find notes "intitle:\"" & note_name & "\""
		
		if 1 = (count of note_found) then
			export note_found to (POSIX file html_path) format HTML
			return true
		end if
		
		return false
		
	end tell
	
end run