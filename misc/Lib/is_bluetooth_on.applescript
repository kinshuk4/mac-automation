set is_bluetooth_on to do shell script "/usr/local/bin/blueutil power"

return ("1" = is_bluetooth_on)