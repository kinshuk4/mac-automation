
tell application "Evernote"
    try
        set theNotes to selection
        set note1 to first item in theNotes
        get title of note1
    end try
end tell