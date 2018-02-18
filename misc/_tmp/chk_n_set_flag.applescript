on run {flag}
	
	set is_set to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/get_flag.applescript") with parameters {flag}
	if is_set then
		return true
	else
		
		set result to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/set_flag.applescript") with parameters {flag}
		if result then
			return false
		else
			return "error?"
		end if
		
	end if
	
end run