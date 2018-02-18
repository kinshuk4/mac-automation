-- download github repo

tell application "System Events" to set activeApp to name of application processes whose frontmost is true

set activeAppName to (activeApp as string)
if (activeAppName = "Google Chrome") or (activeAppName = "Google Chrome Canary") then
    using terms from application "Google Chrome"
        tell application (activeApp as string)
            tell active tab of window 1
                execute javascript "document.querySelectorAll('.get-repo-btn')[1].click()"
            end tell
        end tell
    end using terms from
end if