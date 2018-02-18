repeat with i from 1 to 5
	
	try
		do shell script "ping -c 4 baidu.com"
		exit repeat
		
	on error
		
		delay 0.2
		if i = 5 then return false
		
	end try
	
end repeat

return true