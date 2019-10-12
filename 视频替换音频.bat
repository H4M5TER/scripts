@echo off
cd /D "%~dp0"

set prefix=ffmpeg -i "%~1" -i "%~2" 
if /I "%~x1"==".mp4" (
    set middle=-map 0:v -map 1:a 
    set video=%~nx1
) else (
    set middle=-map 0:a -map 1:v 
    set video=%~nx2
)
set suffix=-c copy %video%

set command=%prefix%%middle%%suffix%
echo on
%command%
@echo off
echo %command% >> command.log

pause
