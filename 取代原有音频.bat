@echo off
cd /D "%~dp0"
echo on
if /I "%~x1"==".mp4" (
goto video_first
) else (
goto audio_first
)
:video_first
ffmpeg -i "%~1" -i "%~2" -map 0:v -map 1:a -c copy "combine.mp4"
@echo ffmpeg -i "%~1" -i "%~2" -map 0:v -map 1:a -c copy "combine.mp4" >> command.log
goto end
:audio_first
ffmpeg -i "%~1" -i "%~2" -map 0:a -map 1:v -c copy "combine.mp4"
@echo ffmpeg -i "%~1" -i "%~2" -map 0:a -map 1:v -c copy "combine.mp4" >> command.log
goto end
:end
@echo off
pause
