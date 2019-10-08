@echo off
cd /D "%~dp0"
for %%F in (%*) do call :main %%F
pause
goto :eof

:main
setlocal
echo on
graphicsmagick convert "%~1" "%~n1".png
@echo off
goto :eof
endlocal
goto :eof
