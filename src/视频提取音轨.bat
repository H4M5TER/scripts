@echo off
cd /D "%~dp0"

for %%F in (%*) do call :main %%F

pause
goto :eof

:main
setlocal

set command=ffmpeg -i "%~1" -map 0:2 -c:a copy "%~n1_第一音轨_电脑声_如游戏.aac" -map 0:4 -c:a copy "%~n1_第三音轨_麦克风.aac" -map 0:3 -c:a copy "%~n1_第二音轨_点歌机.aac"
echo on
%command%
@echo off
echo %command% >> command.log

endlocal
