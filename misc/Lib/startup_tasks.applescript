on run argv
	
	set uptime to do shell script "uptime | awk '{print $3}' | awk -F: '{print $1$2}' | awk -F, '{print $1}'"
	if (result as integer) < 3 then delay 10
	
	if script = class of argv then
		set is_startup to true
	else
		set is_startup to (item 1 of argv)
	end if
	
	set apps to {}
	#set apps to apps & {{name:"iStat Menus", ac_power:true}} # Slow
	#set apps to apps & {{name:"Moom", ac_power:true}}
	#set apps to apps & {{name:"ClipMenu", ac_power:true}}
	#set apps to apps & {{name:"Bartender 2", ac_power:true}}
	#set apps to apps & {{name:"HyperSwitch", ac_power:true}}
	##set apps to apps & {{name:"HyperDock Helper", ac_power:true}}
	#set apps to apps & {{name:"Amphetamine", ac_power:true}}
	#set apps to apps & {{name:"Flux", ac_power:true}}
	#set apps to apps & {{name:"HazeOver", ac_power:true}}
	#set apps to apps & {{name:"ShadowsocksX-NG", online:true}}
	#set apps to apps & {{name:"Google Chrome", ac_power:true, online:true}} # Slow
	#set apps to apps & {{name:"Evernote", ac_power:true, online:true}}
	
	set is_ac_power to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/is_ac_power.applescript")
	set is_online to run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/is_network_available.applescript")
	
	repeat with each_app in apps
		log each_app # tmp
		
		set is_allowed to true
		
		try
			if (online of each_app) ­ is_online then
				set is_allowed to false
			end if
		on error # -1728: undefined field 'online'
			# do nothing
		end try
		
		try
			if (ac_power of each_app) ­ is_ac_power then
				set is_allowed to false
			end if
		on error # -1728: undefined field 'ac_power'
			# do nothing
		end try
		
		if is_startup then
			if is_allowed and not (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/is_app_running.applescript") with parameters {name of each_app}) then
				tell application (name of each_app) to launch
			end if
		else
			if not is_allowed and (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/is_app_running.applescript") with parameters {name of each_app}) then
				tell application (name of each_app) to quit
			end if
		end if
	end repeat
	
	# Romove iStatMenus from Dock
	if is_startup then
		set target_app to "iStat Menus"
		
		if (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/is_app_running.applescript") with parameters target_app) and (run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/is_app_on_dock.applescript") with parameters target_app) then
			tell application target_app to quit
		end if
	end if
	
	# Arrange Windows by Moom
	tell application "System Events"
		
		# Trigger Moom Keyboard Control
		keystroke "d" using {option down}
		
		delay 0.2
		
		# Trigger Arrange Windows
		keystroke "z"
		
	end tell
	
end run