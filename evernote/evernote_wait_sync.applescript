if application "Evernote" is running then
	
	tell application "Evernote"
		
		synchronize
		
		repeat with i from 0 to 300
			if not isSynchronizing then
				return i
			end if
			delay 0.01
		end repeat
		
		# time > 3.0 sec
		# too long !
		return false
		
	end tell
	
else
	return false
end if