@echo off
cd /D "%~dp0"

if /I "%~x1"==".mp4" (
    set video=%~1
    set video_name=%~n1
    copy /Y "%~2" subtitle.ass
) else (
    set video=%~2
    set video_name=%~n2
    copy /Y "%~1" subtitle.ass
)

rem W-w equals to main_w - overlay_w
rem 16*2=32 9*2=18
rem 视logo.png分辨率为480*135
set prefix=".\vendor\ffmpeg" -i "%video%" -i logo.png -filter_complex "[0:v]ass=subtitle.ass[subtitled];[subtitled][1:v]overlay=W-w-32:18" -c:v h264 -profile:v main -level 4.2 
set suffix1=-pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL
set suffix2=-pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -map 0:a -c:a copy "%video_name%_encoded.mp4"

%prefix%%suffix1%
%prefix%%suffix2%

echo %prefix%%suffix1% >>"cmd.log"
echo %prefix%%suffix2% >>"cmd.log"

del ffmpeg2pass-0.log
del ffmpeg2pass-0.log.mbtree
del subtitle.ass

pause
