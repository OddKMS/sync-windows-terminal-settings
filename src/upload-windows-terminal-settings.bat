@echo off

CALL %~dp0helpers/set-variables.bat

:start
    IF NOT EXIST "%CloudTerminalSettingsPath%" MKDIR "%CloudTerminalSettingsPath%"
    IF EXIST "%CloudTerminalSettings%" GOTO :cloudSettingsExists
    GOTO :uploadSettings

:cloudSettingsExists
    ECHO.
    SET input=
    SET /p input="Cloud backup already exists. Overwrite? (Y/N): "
    IF NOT '%input%'=='' SET input=%input:~0,1%
    IF '%input%'=='Y' GOTO overwrite
    IF '%input%'=='y' GOTO overwrite
    IF '%input%'=='N' GOTO end
    IF '%input%'=='n' GOTO end
    IF '%input%'==''  GOTO :cloudSettingsExists
    ECHO "%input%" is not valid & GOTO :cloudSettingsExists
    GOTO :cloudSettingsExists

:overwrite
    DEL "%CloudTerminalSettings%"
    ECHO %CloudTerminalSettings% deleted.
    GOTO :uploadSettings

:uploadSettings
    ECHO.
    ECHO Uploading Windows Terminal settings to %CloudTerminalSettings%
    MKLINK /H "%CloudTerminalSettings%" "%LocalTerminalSettings%" > NUL

:end
    EXIT 0