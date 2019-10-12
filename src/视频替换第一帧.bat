@echo off
cd /D "%~dp0"

if /I "%~x1"==".mp4" (
    set video=%~1
    set cover=%~2
) else (
    set video=%~2
    set cover=%~1
)

rem 仅仅替换第一帧应该不需要重新压制 但是如果使用拼接的方法好像更麻烦 之后再试试
set prefix=ffmpeg -i "%video%" -i "%cover%" -filter_complex "[0:v][1:v]overlay=x='if(eq(t,0),0,NaN)':y=0" -c:v h264 -profile:v main -level 4.2 
set suffix1=-pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL
set suffix2=-pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -map 0:a -c:a copy "%~n1_first_frame_replaced.mp4"

echo on
%prefix%%suffix1%
%prefix%%suffix2%
@echo off
echo %prefix%%suffix1% >> command.log
echo %prefix%%suffix2% >> command.log
del ffmpeg2pass-0.log
del ffmpeg2pass-0.log.mbtree

pause
