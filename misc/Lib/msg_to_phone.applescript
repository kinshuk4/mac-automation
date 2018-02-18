on run argv
	
	if script = (class of argv) then
		return
	else
		set msg to (item 1 of argv)
		set phoneNum to (item 2 of argv)
	end if
	
	tell application "Messages"
		set msgService to 1st service whose service type = iMessage
		# You need to have a chat with that phone number in Messages! Or it will error
		set targetBuddy to buddy phoneNum of msgService
		send msg to targetBuddy
		quit
	end tell
	
	display alert "Sent: {{" & msg & "}}" giving up after 3

end run