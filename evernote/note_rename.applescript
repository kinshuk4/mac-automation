on run {note_name, new_note_name}
	
	if (note_name = new_note_name) then return false
	
	run script (POSIX file "~/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		set note_found to find notes "intitle:\"" & note_name & "\""
		
		if (count of note_found) = 1 then
			set title of item 1 of note_found to new_note_name
			return true
		end if
		
		return false
		
	end tell
	
end run