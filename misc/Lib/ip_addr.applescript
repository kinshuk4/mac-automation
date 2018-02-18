on run argv
	
	set copy_to_clipboard to false
	set is_show_ip to false
	
	if script ­ class of argv then
		if true = (item 1 of argv) then
			set copy_to_clipboard to true
		end if
		if true = (item 2 of argv) then
			set is_show_ip to true
		end if
	end if
	
	# Physical from Ethernet Adapter
	set cur_ip to do shell script "/sbin/ifconfig en7|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'"
	
	# Physical from Docking Station
	if cur_ip = "" then
		set cur_ip to do shell script "/sbin/ifconfig en9|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'"
	end if
	
	if cur_ip = "" then
		# Wireless
		set cur_ip to do shell script "/sbin/ifconfig en0|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'"
	end if
	
	if cur_ip ­ "" then
		if copy_to_clipboard then
			do shell script "echo '" & cur_ip & "' | tr -d \"\\n\" | pbcopy"
		end if
		
		if is_show_ip then
			display alert "IP: " & cur_ip giving up after 15
		end if
	end if
	
	return cur_ip

end run