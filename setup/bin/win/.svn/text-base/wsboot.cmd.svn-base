@echo off

SETLOCAL
REM set JEUS_HOME if not specified
set FileDir=%~dp0
if "%JEUS_HOME%" == "" ^
set JEUS_HOME=%FileDir:~0,-5%
set JEUS_WSDIR=%JEUS_HOME%\webserver

REM set JEUS properties
CALL %JEUS_HOME%\bin\jeus.properties.cmd
"%JEUS_HOME%\webserver\bin\wsboot.exe" %*



ENDLOCAL
