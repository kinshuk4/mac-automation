on run {notebook_name}
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		return (notebook named notebook_name exists)
		
		notebook named notebook_name exists
		
	end tell
	
end run