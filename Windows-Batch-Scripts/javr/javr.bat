@echo off
setlocal
IF [%1] == [] (CALL :NOPARAM) ELSE (CALL :RUN_JAVA %1)
GOTO :EOF

:RUN_JAVA
javac %~dpnx1 && cd %~dp1 && java %~n1
exit /b

:NOPARAM
ECHO No parameter Error
exit /b