on run argv
	
	if script = class of argv then
		return false
	else
		set today to (item 1 of argv)
		set flag_name to (item 2 of argv)
	end if
	
	
	
	set day_dd to day of today
	if day_dd < 10 and day_dd > 0 then
		set day_dd to ("0" & day_dd)
	end if
	
	set month_mm to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/month2mm.applescript") with parameters {today}
	set year_yyyy to year of today
	set year_yy to (year_yyyy mod 100)
	
	set flag to ("Daily_Task/" & year_yy & month_mm & day_dd & "_run_" & flag_name)
	
	return run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/get_flag.applescript") with parameters {flag}
	
end run