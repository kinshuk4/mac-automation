on run {notebook_name}
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		if not (notebook named notebook_name) exists then
			create notebook notebook_name
			return true
		end if
		
		return false
		
	end tell
	
end run