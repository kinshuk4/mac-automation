on run {notebook_name}
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		if (notebook named notebook_name) exists then
			set dialogReply to display alert Â
				"Warning!" message ("Notebook named {" & notebook_name & "}") Â
				as warning Â
				buttons {"Cancel", "Delete"} Â
				default button 1 Â
				giving up after 9
			
			if "Delete" = (button returned of result) then
				delete (notebook named notebook_name)
				return true
			end if
		end if
		
		return false
		
	end tell
	
end run