set cur_path to POSIX path of ((path to me as text) & "::")

set cmd to ("cd " & cur_path & " && clear") as string

return run script (POSIX file "/Users/IceHe/Documents/AppleScript/Lib/cmds_in_iterm.applescript") with parameters {{cmd}}