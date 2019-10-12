@echo off
cd /D "%~dp0"

if /I "%~x1"==".mp4" (
    set video=%~1
    set subtitle=%~nx2
    copy /Y "%~2" %subtitle%
) else (
    set video=%~2
    set subtitle=%~nx1
    copy /Y "%~1" %subtitle%
)

set prefix=ffmpeg -i "%video%" -vf "ass=%subtitle%" -c:v h264 -profile:v main -level 4.2 
set suffix1=-pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL
set suffix2=-pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -c:a copy "%~n1_subtitled.mp4"

echo on
%prefix%%suffix1%
%prefix%%suffix2%
@echo off
echo %prefix%%suffix1% >> command.log
echo %prefix%%suffix2% >> command.log
del ffmpeg2pass-0.log
del ffmpeg2pass-0.log.mbtree
del %subtitle%

pause
