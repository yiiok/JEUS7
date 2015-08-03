@echo off
SETLOCAL

REM set JEUS_HOME if not specified
set FileDir=%~dp0
if "%JEUS_HOME%" == "" ^
set JEUS_HOME=%FileDir:~0,-5%

REM set JEUS properties
CALL %JEUS_HOME%\bin\jeus.properties.cmd

IF ERRORLEVEL == 3 EXIT /B

REM set boot parameters
SET BOOT_PARAMETER=%*

REM execute the upgrade tool
"%JAVA_HOME%\bin\java" ^
    -jar %JEUS_HOME%\lib\systemapps\upgrade-tool/jeus-upgrade-tool.jar %BOOT_PARAMETER%

ENDLOCAL