@echo off 
setlocal
set PYTHON_EXTENSION=.py
set BATCH_EXTENSION=.bat
set JAVA_EXTENSION=.java

set _filename=%~n1
set _extension=%~x1
echo input file name is "%_filename%" and extension is "%_extension%" . Running with appropriate compiler/interpretor...
echo.

if %_extension%==%PYTHON_EXTENSION% (call :RUN_PYTHON %1)
if %_extension%==%JAVA_EXTENSION% (call :RUN_JAVA %1)
if %_extension%==%BATCH_EXTENSION% (call :RUN_BAT %1)
GOTO :EOF

:RUN_PYTHON
python %~dpnx1
exit /b

:RUN_JAVA
javac %~dpnx1 && cd %~dp1 && java %~n1
exit /b

:RUN_BAT
(%~dpn1)
exit /b