on run {app_name, key_code, using_btn}
	
	tell application "System Events" to tell process app_name
		
		delay 0.3 # we have to wait for a while to make keystroke successful
		key code key_code using using_btn
		
	end tell
	
end run