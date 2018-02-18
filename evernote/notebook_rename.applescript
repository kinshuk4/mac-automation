on run {notebook_name, new_notebook_name}
	
	if (notebook_name = new_notebook_name) then return false
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		if ((exists (notebook named notebook_name)) and not (exists (notebook named new_notebook_name))) then
			set name of (notebook named notebook_name) to new_notebook_name
			return true
		end if
		
		return false
		
	end tell
	
end run