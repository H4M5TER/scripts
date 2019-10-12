@echo off
cd /D "%~dp0"

rem W-w equals to main_w - overlay_w
rem 16*2=32 9*2=18
set prefix=ffmpeg -i "%~1" -i "logo.png" -filter_complex "[0:v][1:v]overlay=W-w-32:18" -c:v h264 -profile:v main -level 4.2 
set suffix1=-pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL
set suffix2=-pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -map 0:a -c:a copy "%~n1_watermarked.mp4"

echo on
%prefix%%suffix1%
%prefix%%suffix2%
@echo off
echo %prefix%%suffix1% >> command.log
echo %prefix%%suffix2% >> command.log
del ffmpeg2pass-0.log
del ffmpeg2pass-0.log.mbtree

pause
