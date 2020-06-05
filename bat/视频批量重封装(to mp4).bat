@echo off
cd /D "%~dp0"

for %%F in (%*) do call :main %%F

pause
goto :eof

:main
setlocal

set cmd=".\vendor\ffmpeg" -i "%~1" -c copy "%~n1.mp4"
echo on
%cmd%
@echo off
echo %cmd% >>"cmd.log"

endlocal
