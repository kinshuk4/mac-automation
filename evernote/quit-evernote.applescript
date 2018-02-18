-- https://github.com/IceHe/applescript-for-evernote/blob/e5c52437267e1faec3e3e14f6122bb9ac461d6ed/evernote_quit.applescript
if application "Evernote" is running then
	
	tell application "Evernote"
		quit
	end tell
	
	return true
	
end if

return false
