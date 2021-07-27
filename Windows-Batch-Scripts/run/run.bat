@echo off 
setlocal
set PYTHON_EXTENSION=.py
set BATCH_EXTENSION=.bat
set JAVA_EXTENSION=.java
set KOTLIN_EXTENSION=.kt
set JAR_EXTENSION=.jar
set TEXT_EXTENSION=.txt
set JS_EXTENSION=.js
set SUPPORTED_FORMATS=%PYTHON_EXTENSION% %BATCH_EXTENSION% %JAVA_EXTENSION% %KOTLIN_EXTENSION% %JAR_EXTENSION% %TEXT_EXTENSION% %JS_EXTENSION%

if [%1] == [] (call :NO_PARAM && exit /b) else (call :VALIDATE_FORMATS %1 && exit /b)

:NO_PARAM
echo No Argument Found. Valid command: 'run path/to/file/filename.extension'
exit /b

:VALIDATE_FORMATS
set _extension=%~x1
for %%i in (%SUPPORTED_FORMATS%) do if %%i==%_extension% ((call :COMPILE %1) && exit /b)
(call :UNSUPPORTED_FORMAT %_extension%)
exit /b

:COMPILE
set _filename=%~n1
set _extension=%~x1
echo input file name is "%_filename%" and extension is "%_extension%" . Running with appropriate compiler/interpretor...
echo.

if %_extension%==%PYTHON_EXTENSION% (call :RUN_PYTHON %1)
if %_extension%==%JAVA_EXTENSION% (call :RUN_JAVA %1)
if %_extension%==%BATCH_EXTENSION% (call :RUN_BAT %1)
if %_extension%==%KOTLIN_EXTENSION% (call :RUN_KOTLIN %1)
if %_extension%==%JAR_EXTENSION% (call :RUN_JAR %1)
if %_extension%==%TEXT_EXTENSION% (call :RUN_TEXT %1)
if %_extension%==%JS_EXTENSION% (call :RUN_JS %1)
exit /b

:UNSUPPORTED_FORMAT
echo Format %1 not yet supported.
echo Supported formats are:
for %%i in (%SUPPORTED_FORMATS%) do (echo %%i)
exit /b

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

:RUN_TEXT
notepad %1
exit /b

:RUN_JS
node %1
REM node auto executes ```exit \b```.