@echo off 
echo Hello World!!!

set "mypathwfilenames="
set "mypathtosearch="
set mypathwfilenames= PUT PATH HERE
set mypathtosearch= PUT PATH HERE
SETLOCAL EnableDelayedExpansion

for %%f in (%mypathwfilenames%*) do (
    call :myInnerLoop "%%f"
)

:myInnerLoop
for /r %mypathtosearch% %%a in (*) do (
        rem echo Looking for %%~nf.png == %%~nxa in %%a
        if %%~nxa==%%~nf.png (
            set p=%%~dpnxa
            echo Coping %p% to %mypathwfilenames%
            xcopy /s/z %p% %mypathwfilenames%
            goto :next
        )
    )
:next
goto :eof
