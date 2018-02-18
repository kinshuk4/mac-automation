on run argv
	
	if (do shell script "uptime") contains "mins," then
		set uptime to do shell script "uptime | awk -F 'mins,' '{print $1}' | awk '{print $3}'"
	else
		set uptime to do shell script "uptime | awk -F ',' '{print $1}' | awk '{print $3}' | awk -F ':' '{hrs=$1; min=$2; print hrs*60 + min}'"
	end if
	
	if (uptime as integer) > 9 then
		return uptime
	end if
	
	set wifi_name to do shell script "networksetup -getairportnetwork en0 | awk -F ': ' '{print $2}'"
	
	if wifi_name = "Sina Plaza Mobile" then return do shell script "networksetup -setairportnetwork en0 'Sina Plaza Office' urtheone"
	
end run
