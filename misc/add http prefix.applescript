set tabUrl to "asdfds.com"

if (characters 4 thru 1 of tabUrl as string) is not equal to "http" then
    set tabUrl to "http://" & tabUrl
end if