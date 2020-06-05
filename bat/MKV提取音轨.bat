@echo off
chcp 65001
cd /D "%~dp0"

for %%F in (%*) do call :main %%F

pause
goto :eof

:main
setlocal

".\vendor\ffprobe.exe" "%~1" >"probe.txt" 2>&1
echo %~n1: >>"cmd.log"
for /f "tokens=2" %%i in ('findstr "Audio" "probe.txt"') do (
    call set track=%%i%%
    rem TODO: 自动生成后缀名
    call set cmd=".\vendor\ffmpeg.exe" -i "%~1" -map %%track:~1,-1%% -c:a copy "%~n1_第%%track:~-2,1%%音轨.aac"
    call echo %%cmd%% >>"cmd.log"
    call %%cmd%%
)
del probe.txt

endlocal
