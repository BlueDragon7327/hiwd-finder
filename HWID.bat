@echo off
setlocal

:: Retrieve and process MAC addresses
for /f "tokens=1,* delims= " %%A in ('getmac /v /fo list') do (
    if "%%A"=="Physical" (
        set "MAC=%%B"
        goto :found
    )
)

:found
:: Remove any surrounding quotes and extra spaces from the MAC address
set "MAC=%MAC:"=%"
set "MAC=%MAC: =%"

:: Copy MAC address to clipboard
echo %MAC% | clip

:: Notify the user
echo Physical MAC address has been copied to clipboard.
pause
