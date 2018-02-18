on run {app_name}
	
	tell application "System Events"
		return (name of processes) contains (app_name)
	end tell
	
end run