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

REM set classpath
SET CLASS_PATH=%JEUS_HOME%\lib\client\clientcontainer.jar
SET CLASS_PATH=%CLASS_PATH%;%JEUS_HOME%\lib\system\activation.jar
SET CLASS_PATH=%CLASS_PATH%;%JEUS_HOME%\lib\system\mail.jar
SET CLASS_PATH=%CLASS_PATH%;%JEUS_HOME%\lib\system\jeus-ws.jar
SET CLASS_PATH=%CLASS_PATH%;%JEUS_HOME%\lib\system\wsdl4j.jar
SET CLASS_PATH=%CLASS_PATH%;%JEUS_HOME%\lib\system\webservices-rt.jar
SET CLASS_PATH=%CLASS_PATH%;%JEUS_HOME%\lib\system\jaxb2-basics-runtime.jar
SET CLASS_PATH=%CLASS_PATH%;%JEUS_HOME%\lib\system\jeusasm.jar
SET CLASS_PATH=%CLASS_PATH%;%JEUS_HOME%\lib\system\xalan.jar

REM execute appclient-ws
"%JAVA_HOME%\bin\java" -classpath "%CLASS_PATH%" ^
    %TOOL_OPTION% ^
    -Djava.endorsed.dirs="%JEUS_HOME%\lib\endorsed" ^
    -Djava.naming.factory.initial=jeus.jndi.JNSContextFactory ^
    -Djava.naming.factory.url.pkgs=jeus.jndi.jns.url ^
    -Djeus.log.level=WARNING ^
    %JAVA_ARGS% ^
    jeus.client.container.ClientContainer %BOOT_PARAMETER%

ENDLOCAL
