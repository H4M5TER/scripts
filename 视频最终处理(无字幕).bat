@echo off
cd /D "%~dp0"
if /I "%~x1"==".mp4" (
goto video_first
) else (
goto subtitle_first
)
:video_first
echo on
%~dp0ffmpeg -i "%~1" -i "%~dp0logo.png" -i "%~2" -filter_complex "[0:v][1:v]overlay=main_w-overlay_w-32:18[watermarked];[2:v]scale=1920:1080[cover];[watermarked][cover]overlay=x='if(eq(t,0),0,NaN)':y=0" -c:v h264 -profile:v main -level 4.2 -pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL
@echo ffmpeg -i "%~1" -i "%~dp0logo.png" -i "%~2" -filter_complex "[0:v][1:v]overlay=main_w-overlay_w-32:18[watermarked];[2:v]scale=1920:1080[cover];[watermarked][cover]overlay=x='if(eq(t,0),0,NaN)':y=0" -c:v h264 -profile:v main -level 4.2 -pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL >> command.log
%~dp0ffmpeg -i "%~1" -i "%~dp0logo.png" -i "%~2" -filter_complex "[0:v][1:v]overlay=main_w-overlay_w-32:18[watermarked];[2:v]scale=1920:1080[cover];[watermarked][cover]overlay=x='if(eq(t,0),0,NaN)':y=0" -c:v h264 -profile:v main -level 4.2 -pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -map 0:a -c:a copy "%~n1.mp4"
@echo ffmpeg -i "%~1" -i "%~dp0logo.png" -i "%~2" -filter_complex "[0:v][1:v]overlay=main_w-overlay_w-32:18[watermarked];[2:v]scale=1920:1080[cover];[watermarked][cover]overlay=x='if(eq(t,0),0,NaN)':y=0" -c:v h264 -profile:v main -level 4.2 -pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -map 0:a -c:a copy "%~n1.mp4" >> command.log
@echo off
goto end
:subtitle_first
echo on
%~dp0ffmpeg -i "%~2" -i "%~dp0logo.png" -i "%~1" -filter_complex "[0:v][1:v]overlay=main_w-overlay_w-32:18[watermarked];[2:v]scale=1920:1080[cover];[watermarked][cover]overlay=x='if(eq(t,0),0,NaN)':y=0" -c:v h264 -profile:v main -level 4.2 -pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL
@echo ffmpeg -i "%~2" -i "%~dp0logo.png" -i "%~1" -filter_complex "[0:v][1:v]overlay=main_w-overlay_w-32:18[watermarked];[2:v]scale=1920:1080[cover];[watermarked][cover]overlay=x='if(eq(t,0),0,NaN)':y=0" -c:v h264 -profile:v main -level 4.2 -pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL >> command.log
%~dp0ffmpeg -i "%~2" -i "%~dp0logo.png" -i "%~1" -filter_complex "[0:v][1:v]overlay=main_w-overlay_w-32:18[watermarked];[2:v]scale=1920:1080[cover];[watermarked][cover]overlay=x='if(eq(t,0),0,NaN)':y=0" -c:v h264 -profile:v main -level 4.2 -pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -map 0:a -c:a copy "%~n2.mp4"
@echo ffmpeg -i "%~2" -i "%~dp0logo.png" -i "%~1" -filter_complex "[0:v][1:v]overlay=main_w-overlay_w-32:18[watermarked];[2:v]scale=1920:1080[cover];[watermarked][cover]overlay=x='if(eq(t,0),0,NaN)':y=0" -c:v h264 -profile:v main -level 4.2 -pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -map 0:a -c:a copy "%~n2.mp4" >> command.log
@echo off
goto end
:end
del ffmpeg2pass-0.log
del ffmpeg2pass-0.log.mbtree
pause
