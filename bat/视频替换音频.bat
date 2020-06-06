@echo off
cd /D "%~dp0"

if /I "%~x1"==".mp4" (
    set middle=-map 0:v -map 1:a 
    set video=%~nx1
) else (
    set middle=-map 0:a -map 1:v 
    set video=%~nx2
)

set cmd=".\vendor\ffmpeg" -i "%~1" -i "%~2" %middle% -c copy %video%
%cmd%
echo %cmd% >>"cmd.log"

pause
