set value11 to missing value
tell application "Google Chrome"
	--activate
	tell application "System Events"
		tell application process "Google Chrome"
			set value11 to value of text field 1 of toolbar 1 of window 1
		end tell
	end tell
end tell

display dialog value11 