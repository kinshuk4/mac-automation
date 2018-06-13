on run argv
	if (count of argv) > 2 then
		set note_name to item 1 of argv
	else
		set note_name to text returned of (display dialog "Enter the text to search:" default answer "")
	end if
	
	tell application "Evernote"
		
		set notes_found to (find notes ("intitle:\"" & note_name & "\""))
		
		if notes_found = {} then
			return false
		else if (count of notes_found) > 1 then
			repeat with note_found in notes_found
				set the new_note_title to my replace_chars((note_found's title) as string, note_name, "")
				set title of note_found to new_note_title
			end repeat
			
		else
			return true
		end if
		
	end tell
	
end run

on replace_chars(this_text, search_string, replacement_string)
	set AppleScript's text item delimiters to the search_string
	set the item_list to every text item of this_text
	set AppleScript's text item delimiters to the replacement_string
	set this_text to the item_list as string
	set AppleScript's text item delimiters to ""
	return this_text
end replace_chars