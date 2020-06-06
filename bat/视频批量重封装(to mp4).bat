@echo off
cd /D "%~dp0"

for %%F in (%*) do call :main %%F

pause
goto :eof

:main
setlocal

set cmd=".\vendor\ffmpeg" -i "%~1" -map 0:v -map 0:1 -c copy "%~n1.mp4"
%cmd%
echo %cmd% >>"cmd.log"

endlocal
