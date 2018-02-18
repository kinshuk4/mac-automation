on run {app_name, key_char, using_btn}
	
	tell application "System Events" to tell process app_name
		
		delay 0.3 # we have to wait for a while to make keystroke successful
		keystroke key_char using using_btn
		
	end tell
	
end run