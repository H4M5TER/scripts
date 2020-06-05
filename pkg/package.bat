chcp 65001
cd %~dp0
7za a .\toolkit_%date:~0,4%-%date:~5,2%-%date:~8,2%-%time:~0,2%-%time:~3,2% ..\src\视频* .\ffmpeg.exe .\logo.png .\LICENSE.txt .\README.txt
pause
