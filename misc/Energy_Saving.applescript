# 确认：是否进行后续操作
display alert ¬
	"Confirm" message ¬
	"To Energy-Saving-Mode?" as informational ¬
	buttons {"Cancel", "Now!"} ¬
	default button 1 ¬
	giving up after 5

if "Now!" ≠ (button returned of result) then
	return false
end if

return run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/startup_tasks.applescript") with parameters {false}