on run {note_name, attachment_path}
	
	tell application "Evernote" to launch
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		set note_found to find notes "intitle:\"" & note_name & "\""
		
		if 1 = (count of note_found) then
			
			try
				append (item 1 of note_found) attachment (attachment_path as POSIX file)
			on error
				return false
			end try
			
			return true
			
		end if
		
		return false
		
	end tell
	
end run