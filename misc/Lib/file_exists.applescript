on run {file_path}
	
	# General Implement
	
	tell application "System Events"
		return exists file file_path
	end tell
	
	
	
	(* # Implemented by Shell
	
	## Example
	try # will error if not exist
		do shell script "[ -f \"/Users/IceHe/Documents/" & report_path & "\" ]"
	on error
		return false
	end try
	
	## Reverse
	try # will error if exists
		do shell script "[ ! -f \"/Users/IceHe/Documents/" & next_report_path & "\" ]"
	on error
		return false
	end try
	
	return true
	*)
	
end run