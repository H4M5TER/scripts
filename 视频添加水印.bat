@echo off
cd /D "%~dp0"
echo on
ffmpeg -i "%~1" -i "logo.png" -filter_complex "[0:v][1:v]overlay=main_w-overlay_w-32:18" -c:v h264 -profile:v main -level 4.2 -pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL
@echo ffmpeg -i "%~1" -i "logo.png" -filter_complex "[0:v][1:v]overlay=main_w-overlay_w-32:18" -c:v h264 -profile:v main -level 4.2 -pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL >> command.log
ffmpeg -i "%~1" -i "logo.png" -filter_complex "[0:v][1:v]overlay=main_w-overlay_w-32:18" -c:v h264 -profile:v main -level 4.2 -pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -map 0:a -c:a copy "%~dp0%~n1_logo.mp4"
@echo ffmpeg -i "%~1" -i "logo.png" -filter_complex "[0:v][1:v]overlay=main_w-overlay_w-32:18" -c:v h264 -profile:v main -level 4.2 -pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -map 0:a -c:a copy "%~dp0%~n1_logo.mp4" >> command.log
@echo off
del ffmpeg2pass-0.log
del ffmpeg2pass-0.log.mbtree
pause
