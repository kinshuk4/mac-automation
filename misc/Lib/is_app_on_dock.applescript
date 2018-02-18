on run {app_name}
	
	tell application "System Events"
		tell process "Dock"
			tell list 1
				
				try
					set dockItemTest to UI element app_name -- test if the application is in the Dock
				on error
					#beep
					#tell current application to display dialog "The \"" & app_name & "\" application is not in the Dock." buttons {"Cancel"} default button 1 with icon 0 with title "APPLICATION NOT IN THE DOCK"
					return false
				end try
				
				#click UI element app_name
				
				return true
				
			end tell
		end tell
	end tell
	
end run

