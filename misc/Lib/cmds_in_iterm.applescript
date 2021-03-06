on run argv
	
	if script = (class of argv) then
		return false
	else
		set cmds to (item 1 of argv)
	end if
	
	set isOpenAlready to application "iTerm" is running
	
	# 启动终端，然后执行命令行	
	tell application "iTerm"
		
		activate
		
		# OS X 下有可能：iTerm 在脚本执行前已经运行，但还没窗口
		set without_win to 0 = (count of windows)
		if without_win then
			create window with default profile
		end if
		
		
		tell current window
			
			# iTerm 在脚本执行前已经运行，且也有窗口时，
			# 新建一个 tab，避免影响其它 tab 的作业状态。
			if isOpenAlready and not without_win then
				create tab with default profile
			end if
			
			tell current session
				repeat with cmd in cmds
					write text cmd
				end repeat
			end tell
			
		end tell
		
	end tell
	
end run