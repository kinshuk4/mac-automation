on run {flag}
	
	tell application "System Preferences"
		
		reveal pane id "com.apple.preferences.Bluetooth"
		delay 0.1
		
		tell application "System Events" to tell process "System Preferences"
			set bluetooth_switch to button 3 of window 1
			
			if flag = true then
				
				if "Turn Bluetooth Off" ­ name of bluetooth_switch then
					click bluetooth_switch
				end if
				
			else if flag = false then
				
				if "Turn Bluetooth Off" = name of bluetooth_switch then
					click bluetooth_switch
				end if
				
			else
				return "error?"
			end if
			
		end tell
		delay 0.1
		quit
		
	end tell
	
	return true
	
end run