on run {note_name, notebook_name, enex_path}
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		set note_found to find notes "notebook:\"" & notebook_name & "\" intitle:\"" & note_name & "\""
		
		if 1 = (count of note_found) then
			export note_found to (POSIX file enex_path)
			return true
		end if
		
		return false
		
	end tell
	
end run