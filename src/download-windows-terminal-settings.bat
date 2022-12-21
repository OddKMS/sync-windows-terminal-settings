@echo off

CALL %~dp0helpers/set-variables.bat

:start
    ECHO.
    ECHO Shutting down Windows Terminal and deleting local settings file
    ECHO in preparation of cloud download.
    GOTO :isWindowsTerminalRunning

:isWindowsTerminalRunning
    SET WindowsTerminalWasClosed="FALSE"

    TASKLIST /fi "ImageName eq WindowsTerminal.exe" /fo csv 2>NUL | FIND /I "WindowsTerminal.exe">NUL
    IF "%ERRORLEVEL%"=="0" (
            REM Windows Terminal is running, so we close it and re-open it later
            TASKKILL /IM "WindowsTerminal.exe" /F
            SET WindowsTerminalWasClosed="TRUE"
        )

:downloadSettings
    IF EXIST "%LocalTerminalSettings%" DEL "%LocalTerminalSettings%" /q
    ECHO.
    ECHO Downloading Windows Terminal settings to 
    ECHO %LocalTerminalSettings%
    MKLINK /H "%LocalTerminalSettings%" "%CloudTerminalSettings%" > NUL

:end
    IF %WindowsTerminalWasClosed%=="TRUE" START "" "%WindowsTerminalLocation%"
    EXIT 0