# run

```run``` is a simple batch file which can generate appropriate command to compile/interpret/execute supported file types. 

## Currently supported file formats
 1. .py
 2. .java
 3. .bat
 4. .kt
 5. .jar
 6. .txt

## Usage
```run "path\to\file\filename.extension"```


## Examples

```run D:\Folder\SomeAwesomeCode.java```

```run D:\Folder\SomeAwesomeCode.py```

```run D:\Folder\SomeAwesomeScript.bat```

```run D:\Folder\SomeAwesomeCode.kt```

```run D:\Folder\SomeAwesomeJAR.jar```

```run D:\Folder\SomeAwesomeTextFile.txt```


## Note

 - ```run``` doesn't support wildcard characters in its argument yet.
 - Only **1** argument is required. This is the "path\to\file\filename.extension".

Just add this batch file to your system path variables. Then type in the above command in the terminal of your choice (I use CMD).

_Remember to replace "path\to\file\filename.extension" and  accordingly and hit enter._