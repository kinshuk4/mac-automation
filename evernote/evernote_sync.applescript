if application "Evernote" is running then
	
	tell application "Evernote"
		if not isSynchronizing then
			synchronize
		end if
	end tell
	
	return true
	
end if

return false