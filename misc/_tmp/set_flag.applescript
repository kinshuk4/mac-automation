on run {flag}
	
	if "" = flag then
		return false
	end if
	
	set is_set to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/get_flag.applescript") with parameters {flag as string}
	if is_set then
		return true
	end if
	
	do shell script ("mkdir /Users/IceHe/Documents/Registry/Flag/" & flag)
	
	set is_set to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/get_flag.applescript") with parameters {flag}
	if not is_set then
		return false
	end if
	
	return true
	
end run