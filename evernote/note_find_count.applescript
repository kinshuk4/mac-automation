on run argv
	if (count of argv) > 2 then
        set note_name to item 1  of argv
    else
        set note_name to text returned of (display dialog "Enter the text to search:" default answer "")
    end if
	
	-- run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
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