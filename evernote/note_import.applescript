on run {enex_path, notebook_name}
	
	run script (POSIX file "/Users/IceHe/Documents/AppleScript/Evernote/evernote_launch.applescript")
	
	tell application "Evernote"
		
		if (notebook named notebook_name) exists then
			import (enex_path as POSIX file) to notebook_name
			return true
			
			# The old method
			#set file_alias to (POSIX file enex_path) as alias
			#import file_alias to notebook_name
		end if
		
		return false
		
	end tell
	
end run