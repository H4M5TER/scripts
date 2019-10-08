@echo off
cd /D "%~dp0"
for %%F in (%*) do call :main %%F
pause
goto :eof

:main
setlocal
echo on
ffmpeg -i "%~1" -c copy "%~n1.mp4"
@echo off
echo ffmpeg -i "%~1" -c copy "%~n1.mp4" > command.log
endlocal
