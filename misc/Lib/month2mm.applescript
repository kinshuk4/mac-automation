on split_str(str, delimiter)
	
	-- save delimiters to restore old settings
	set oldDelimiter to AppleScript's text item delimiters
	
	-- set delimiters to delimiter to be used
	set AppleScript's text item delimiters to delimiter
	
	-- create the array
	set ary to every text item of str
	
	-- restore the old setting
	set AppleScript's text item delimiters to oldDelimiter
	
	-- return the result
	return ary
	
end split_str



on run argv
	
	if script = (class of argv) then
		set _month to current date
	else
		set _month to (item 1 of argv)
	end if
	
	if date = (class of _month) then
		
		set _month to (item 2 of split_str((short date string of _month), "/")) as integer
		
	else if string = (class of _month) then
		
		set _months_en to {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}
		
		if _months_en contains _month then
			repeat with i from 1 to 12
				if (item i of _months_en) = _month then set _month to i
			end repeat
		else
			set _month to _month as integer
		end if
		
	else if integer = (class of _month) then
		
		# pass
		
	end if
	
	set _month_results to {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"}
	return item _month of _month_results
	
end run