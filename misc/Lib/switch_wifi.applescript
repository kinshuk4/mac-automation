on run {flag}
	
	tell application "System Events" to tell process "SystemUIServer"
		
		set wifi_menu to (first menu bar item whose description contains "Wi-Fi") of menu bar 1
		
		if flag = true then
			
			if description of wifi_menu contains "not enabled" then
				do shell script "networksetup -setairportpower en0 on"
			end if
			
		else if flag = false then
			
			if not (description of wifi_menu contains "not enabled") then
				do shell script "networksetup -setairportpower en0 off"
			end if
			
		else
			return "error?"
		end if
		
		return true
		
	end tell
	
end run