@echo off

REM Uses %OneDriveConsumer% to ensure that the settings are put in OneDrive - Personal
REM if the computer has both Corporate and Personal OneDrive installed

SET WindowsTerminalLocation="%LocalAppData%\Microsoft\WindowsApps\wt.exe"
SET LocalTerminalSettings="%LocalAppData%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
SET CloudTerminalSettings="%OneDriveConsumer%\backup\terminal\windows-terminal-settings.json"
SET CloudTerminalSettingsPath="%OneDriveConsumer%\backup\terminal"