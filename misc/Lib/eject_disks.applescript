tell application "Finder"
	
	-- Eject all disks
	#eject the disks
	#display dialog "Successfully ejected disks." buttons {"Close"} default button "Close"
	
	set need_eject to false
	
	-- Specify disks to eject
	set diskNames to {"IceHe_何志远", "IceHe_OSX_Bak", "ICEHE_18514756663"}
	set disksToEject to {}
	set need_eject to false
	
	-- Check disks existence
	repeat with diskName in diskNames
		try
			disk diskName
			copy diskName to the end of disksToEject
			set need_eject to true
		on error
			# do nothing
		end try
	end repeat
	
	if not need_eject then
		set tips to ""
		repeat with diskName in diskNames
			set tips to tips & " [" & diskName & "]"
		end repeat
		
		display alert ("Disk" & tips & " Not Exist!") giving up after 10
		return
	end if
	
	-- Eject
	eject disksToEject
	(*
	repeat with diskName in disksToEject
		eject diskName
	end repeat
	*)
	
	-- Check & Display operation result
	set sucDisks to {}
	set failDisks to {}
	
	repeat with diskName in diskNames
		
		try
			disk diskName
			set failDisks to failDisks & diskName
		on error
			set sucDisks to sucDisks & diskName
		end try
		
	end repeat
	
	if failDisks ≠ {} then
		set tips to ""
		repeat with diskName in failDisks
			set tips to tips & " [" & diskName & "]"
		end repeat
		display alert "FAIL to eject disks" & tips & "!" giving up after 10
	end if
	
	if sucDisks ≠ {} then
		set tips to ""
		repeat with diskName in sucDisks
			set tips to tips & " [" & diskName & "]"
		end repeat
		display alert "SUC to eject disks" & tips & "." giving up after 10
	end if
	
end tell