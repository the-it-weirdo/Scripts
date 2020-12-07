@echo off 
setlocal
set PYTHON_EXTENSION=.py
set BATCH_EXTENSION=.bat
set JAVA_EXTENSION=.java
set KOTLIN_EXTENSION=.kt
set JAR_EXTENSION=.jar

set _filename=%~n1
set _extension=%~x1
echo input file name is "%_filename%" and extension is "%_extension%" . Running with appropriate compiler/interpretor...
echo.

if %_extension%==%PYTHON_EXTENSION% (call :RUN_PYTHON %1)
if %_extension%==%JAVA_EXTENSION% (call :RUN_JAVA %1)
if %_extension%==%BATCH_EXTENSION% (call :RUN_BAT %1)
if %_extension%==%KOTLIN_EXTENSION% (call :RUN_KOTLIN %1)
if %_extension%==%JAR_EXTENSION% (call :RUN_JAR %1)
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

:RUN_KOTLIN
set _jar=%~dpn1.jar
kotlinc %~dpnx1 -include-runtime -d %_jar% && (call :RUN_JAR %_jar%)
exit /b

:RUN_JAR
java -jar %1
exit /b