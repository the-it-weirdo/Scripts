@echo off
IF [%1] == [] GOTO NOPARAM
javac %1.java
java %1
GOTO END
:NOPARAM
ECHO "No parameter Error"
:END
