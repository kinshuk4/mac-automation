(*
Save Chrome Tab to Selected Note of Evernote
VERSION 1.1

// AUTHORED BY:
    John Xiao (http://zaishanda.com/)

// UPDATE NOTICES
    ** Follow @jfxiao07 on Twitter, Facebook, Google Plus, and ADN for Update Notices! **

// License
    MIT
*)

(* 
======================================
// MAIN PROGRAM 
======================================
*)

-- source: http://alvinalexander.com/blog/post/mac-os-x/an-applescript-subroutine-that-returns-current-time-as-hours-mi
on getTimeInHoursAndMinutes()
    -- Get the "hour"
    set timeStr to time string of (current date)
    set Pos to offset of ":" in timeStr
    set theHour to characters 1 thru (Pos - 1) of timeStr as string
    set timeStr to characters (Pos + 1) through end of timeStr as string
    
    -- Get the "minute"
    set Pos to offset of ":" in timeStr
    set theMin to characters 1 thru (Pos - 1) of timeStr as string
    set timeStr to characters (Pos + 1) through end of timeStr as string
    
    --Get "AM or PM"
    set Pos to offset of " " in timeStr
    set theSfx to characters (Pos + 1) through end of timeStr as string
    
    return (theHour & ":" & theMin & " " & theSfx) as string
end getTimeInHoursAndMinutes

-- source: http://henrysmac.org/blog/2014/1/4/formatting-short-dates-in-applescript.html
on todayISOformat()
    set theDate to current date
    set y to text -4 thru -1 of ("0000" & (year of theDate))
    set m to text -2 thru -1 of ("00" & ((month of theDate) as integer))
    set d to text -2 thru -1 of ("00" & (day of theDate))
    return y & "-" & m & "-" & d
end todayISOformat
set addDateAndTime to (todayISOformat() & " " & getTimeInHoursAndMinutes())

set tabUrl to missing value
set theNote to missing value
set tabTitle to missing value
set activeApp to missing value

tell application "System Events"
    set activeApp to name of application processes whose frontmost is true
    --Don't execute when active window is not chrome or Evernote
    --TODO: optimize this logic check
    if (activeApp as string) is not equal to "Evernote" and (activeApp as string) is not equal to "Google Chrome"  and (activeApp as string) is not equal to "Google Chrome Canary" then
        error number -128
    end if
    --TODO: optimize (activeApp as string)
    tell application process (activeApp as string)
        set tabUrl to value of text field 1 of toolbar 1 of window 1
        if tabUrl = "" then
            error number -128
        end if
        -- Make sure start with http or https
        if (characters 4 thru 1 of tabUrl as string) is not equal to "http" then
            set tabUrl to "http://" & tabUrl
        end if
        --set tabDescription to the text returned of (display dialog "添加描述" default answer "")
        set tabTitle to (title of window 1)
    end tell
end tell

--delay 0.2

--log tabTitle
--log tabUrl
--return

tell application "Evernote"
    try
        set findUrlInNotes to (find notes tabUrl) -- returns a list of notes
        if not findUrlInNotes = {} then
            display notification "已存在于：" & (get title of (item 1 of findUrlInNotes))
            error number -128
        end if

        set theNotes to selection
        set theNote to first item in theNotes
        set notifyTitle to "[" & (get name of (get notebook of theNote)) & "]" & (get title of theNote)
        --if tabDescription is not equal to "" then
            --set tabTitle to tabDescription & "<br/>" & tabTitle
        --end if
        set addContent to "<br/><br/>" & addDateAndTime & "<br/>" & tabTitle & "<br/>" & "<a href=\"" & tabUrl & "\">" & tabUrl & "</a>"
        try
            append theNote html addContent
        on error errMsg
            display notification "Error with append method."
            try
                set noteHTML to (HTML content of item 1 of theNote)
                set editHTML to noteHTML & addContent
                set (HTML content of item 1 of theNote) to editHTML
            on error errMsg
                display notification "Failed all."
            end try
        end try
        -- Only notify when Evernote is not mostfront
        if (activeApp as string) is not equal to "Evernote" then
            display notification tabUrl with title notifyTitle subtitle "《" & tabTitle & "》"
        end if
    end try
end tell