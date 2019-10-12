@echo off
cd /D "%~dp0"

for %%F in (%*) do call :main %%F

pause
goto :eof

:main
setlocal

set command=ffmpeg -i "%~1" -c copy "%~n1.mp4"
echo on
%command%
@echo off
echo %command% >> command.log

endlocal
