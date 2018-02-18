set is_ac_power to do shell script "pmset -g batt | grep -q 'AC Power' && echo 1 || echo 0"

return ("1" = is_ac_power)