
tell application "Evernote"
  
	set the_notes to selection
	
	set the_dialog to display dialog "What would you like to title these notes?" default answer ""
	
	set the_title to text returned of the_dialog

	set the_count to 1
	
	repeat with n in the_notes
		
		set title of n to the_title & " " & the_count
		set the_count to the_count + 1
		
	end repeat
	
end tell