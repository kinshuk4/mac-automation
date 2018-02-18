(*
http://veritrope.com
Evernote -- Add Text To Beginning of Notes
Version 1.0
January 10, 2011
Project Status, Latest Updates, and Comments Collected at:
http://veritrope.com/code/evernote-add-text-to-beginning-of-notes
*)

(* 
======================================
// CONFIGURATION (USER EDITABLE)
======================================
*)
--CHANGE THIS PROPERTY TO THE HTML CODE YOU'D 
--LIKE TO ADD TO THE BEGINNING OF YOUR NOTE.
--(DEFAULT IS 5 LINE BREAKS AND A HORIZONTAL RULE)
property add_to_top : "<br /><br /><br /><br /><br /><hr />"
(* 
======================================
// OTHER PROPERTIES (DO NOT CHANGE)
======================================
*)
property noteHTML : ""
(* 
======================================
// MAIN PROGRAM
======================================
*)
tell application "Evernote"
    try
        set theNotes to selection
        repeat with theNote in theNotes
            set noteHTML to (HTML content of item 1 of theNote)
            set addString to "<body>" & add_to_top
            set editHTML to my replaceString(noteHTML, "<body>", addString)
            set (HTML content of item 1 of theNote) to editHTML
        end repeat
    end try
end tell

(* 
======================================
// HANDLER SUBROUTINES 
======================================
*)
--REPLACE SUBROUTINE
on replaceString(theString, theOriginalString, theNewString)
    set {od, AppleScript's text item delimiters} to {AppleScript's text item delimiters, theOriginalString}
    set theStringParts to text items of theString
    if (count of theStringParts) is greater than 1 then
        set theString to text item 1 of theStringParts as string
        repeat with eachPart in items 2 thru -1 of theStringParts
            set theString to theString & theNewString & eachPart as string
        end repeat
    end if
    set AppleScript's text item delimiters to od
    return theString
end replaceString