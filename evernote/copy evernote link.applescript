(*
◸ Veritrope.com
Get Note Links in Evernote
VERSION 1.0
January 24, 2013

// UPDATE NOTICES
     ** Follow @Veritrope on Twitter, Facebook, Google Plus, and ADN for Update Notices! **

// SUPPORT VERITROPE!
     If this AppleScript was useful to you, please take a second to show your love here: 
    http://veritrope.com/support

// SCRIPT INFORMATION AND UPDATE PAGE
     http://veritrope.com/code/get-note-links-in-evernote-for-newly-created-notes/

// REQUIREMENTS
     More details on the script information page.

// CHANGELOG
    1.0 INITIAL RELEASE

// TERMS OF USE:
     This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. 

     To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.


*)

(* 
======================================
// MAIN PROGRAM 
======================================
*)

--RESET VALUES
set myNote to {}
set noteLink to missing value

tell application "Evernote"
    
    --TEST TO SEE IF EVERNOTE IS CURRENTLY SYNCHRONIZING...
    repeat until isSynchronizing is false
        --THIS EMPTY LOOP WILL PAUSE SCRIPT UNTIL PREVIOUS SYNC IS FINISHED
    end repeat
    
    --CREATE THE NOTE
    set myNote to create note with text "HI!"
    
    --SYNCHRONIZE WITH EVERNOTE'S SERVERS
    synchronize
    
    --PAUSE UNTIL THERE IS A VALUE FOR NOTE LINK
    repeat while noteLink is missing value
        --GET THE NOTE LINK FOR THE CURRENT NOTE
        set noteLink to (note link of myNote)
    end repeat
    
end tell