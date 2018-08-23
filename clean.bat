@echo Clean up output directory
@del /Q /S units\*.*
@del /Q src\*.*~
@del /Q src\*.~*
@rmdir /S /Q src\lib\
@rmdir /S /Q src\backup\
@rmdir /S /Q components\bgrabitmap\lib\
@rmdir /S /Q components\bgrabitmap\lib4nogui\
@rmdir /S /Q components\dexif\lib
@del /Q win32\lazview.dbg
@del /Q win32\lazview*.exe
@del /Q win64\lazview*.exe
@del /Q win32\lazview*.old
@del /Q win64\lazview*.old
@del /Q src\*.bak
@del /Q lazview*.old
@del /Q lazview*.exe
@del /Q lazview*.dbg
@del /Q lazview.zdli
@del /Q lazview
@del /Q units\*.*

@echo Clean up tools output directories
@del /Q /S tools\lib\*.*
@del /Q tools\extractdwrflnfo.exe

@echo Clean up components output directories

@echo Done.