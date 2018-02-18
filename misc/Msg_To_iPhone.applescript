tell application "System Events"
	(*
	# They are equivalent.
	set msg to (do shell script "pbpaste")
	set msg to (the clipboard as text)
	*)
	
	# for Privacy Protection
	set phoneNum to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Private/get_phone_num.applescript")
	
	return run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/msg_to_phone.applescript") with parameters {the clipboard as text, phoneNum}
end tell