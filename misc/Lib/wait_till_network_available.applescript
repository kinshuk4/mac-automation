repeat with i from 1 to 15
	
	try
		do shell script "ping -o baidu.com"
		exit repeat
		
	on error
		
		if i = 15 then return false
		delay 0.33
		
	end try
	
end repeat

return true