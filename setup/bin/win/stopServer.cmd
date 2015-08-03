@echo off
SETLOCAL

REM set JEUS_HOME if not specified
set FileDir=%~dp0
if "%JEUS_HOME%" == "" ^
set JEUS_HOME=%FileDir:~0,-5%

REM set JEUS properties
CALL %JEUS_HOME%\bin\jeus.properties.cmd

IF ERRORLEVEL == 3 EXIT /B

ECHO ****************************************************************************
ECHO   - Usage : stopServer -host host:port -u username -p password
ECHO ****************************************************************************

SET USER_NAME=
SET USERPASSWORD=
SET URL=

:BEFORE
if "%1" == "" GOTO NEXT
	if "%1" == "-host" (
		if NOT DEFINED URL (
	  	    SET URL=%2
	  )
	)
	if "%1" == "-u" (
		if NOT DEFINED USER_NAME (
	  	    SET USER_NAME=%2
	  )
	)
	if "%1" == "-p" (
		if NOT DEFINED USERPASSWORD (
	  	    SET USERPASSWORD=%2
	  )
	)
	SHIFT
GOTO BEFORE
:NEXT

IF NOT DEFINED USER_NAME (
	SET USER_NAME=
) ELSE (
	SET USER_NAME=-u %USER_NAME%
)

IF NOT DEFINED USERPASSWORD (
	SET USERPASSWORD=
) ELSE (
	SET USERPASSWORD=-p %USERPASSWORD%
)

IF NOT DEFINED URL (
	SET URL=
)

REM set boot parameter
IF DEFINED USERNAME (
	SET BOOT_PARAMETER=-u %USERNAME% -p %PASSWORD%
) ELSE (
	SET BOOT_PARAMETER=%USER_NAME% %USERPASSWORD%
)

REM execute jeusadmin
"%JAVA_HOME%\bin\java" -classpath "%BOOTSTRAP_CLASSPATH%" %TOOL_OPTION% ^
    -Djeus.home="%JEUS_HOME%" ^
    -Djava.library.path="%JEUS_LIBPATH%" ^
    -Djava.endorsed.dirs="%JEUS_HOME%\lib\endorsed" ^
    -Djava.naming.factory.initial=jeus.jndi.JNSContextFactory ^
    -Djava.naming.factory.url.pkgs=jeus.jndi.jns.url ^
    -Djava.util.logging.config.file="%JEUS_HOME%\bin\logging.properties" ^
    %JAVA_ARGS% ^
    %BOOTSTRAPPER% ^
    jeus.tool.console.console.ConsoleMain local-shutdown -host %URL% %BOOT_PARAMETER%

ENDLOCAL