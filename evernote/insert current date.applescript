set {year:y, month:m, day:d} to (current date)

set date_format to {y, "-", m * 1, "-", d} as string
set the clipboard to the date_format

tell application "System Events"
	keystroke "v" using command down
end tell