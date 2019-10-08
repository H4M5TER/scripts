@echo off
if /I "%~x1"==".mp4" (
goto video_first
) else (
goto subtitle_first
)
:video_first
cd /D "%~dp2"
echo on
%~dp0ffmpeg -i "%~1" -vf "subtitles=%~nx2" -codec:v h264 -profile:v main -level 4.2 -pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL
@echo ffmpeg -i "%~1" -vf "subtitles=%~nx2" -codec:v h264 -profile:v main -level 4.2 -pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL >> command.log
%~dp0ffmpeg -i "%~1" -vf "subtitles=%~nx2" -codec:v h264 -profile:v main -level 4.2 -pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -codec:a copy "%~dp0%~n1_subtitled.mp4"
@echo ffmpeg -i "%~1" -vf "subtitles=%~nx2" -codec:v h264 -profile:v main -level 4.2 -pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -codec:a copy "%~dp0%~n1_subtitled.mp4" >> command.log
@echo off
goto end
:subtitle_first
cd /D "%~dp1"
echo on
%~dp0ffmpeg -i "%~2" -vf "subtitles=%~nx1" -codec:v h264 -profile:v main -level 4.2 -pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL
@echo ffmpeg -i "%~2" -vf "subtitles=%~nx1" -codec:v h264 -profile:v main -level 4.2 -pass 1 -b:v 6000K -bufsize 6000K -maxrate 24000K -an -f mp4 -y NUL >> command.log
%~dp0ffmpeg -i "%~2" -vf "subtitles=%~nx1" -codec:v h264 -profile:v main -level 4.2 -pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -codec:a copy "%~dp0%~n2_subtitled.mp4"
@echo ffmpeg -i "%~2" -vf "subtitles=%~nx1" -codec:v h264 -profile:v main -level 4.2 -pass 2 -b:v 6000K -bufsize 6000K -maxrate 24000K -codec:a copy "%~dp0%~n2_subtitled.mp4" >> command.log
@echo off
goto end
:end
del ffmpeg2pass-0.log
del ffmpeg2pass-0.log.mbtree
pause
goto eof
