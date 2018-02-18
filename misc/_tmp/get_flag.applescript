on run {flag}
	
	if "" = flag then
		return false
	end if
	
	tell application "System Events"
		
		set folder_path to ("/Users/IceHe/Documents/Registry/Flag/" & flag)
		if exists folder folder_path then
			return true
		else
			return false
		end if
		
	end tell
	
end run