chcp 65001
cd /D %~dp0
D:\CLI\7-zip\7za a ".\video_kit_%date:~0,4%-%date:~5,2%-%date:~8,2%-%time:~0,2%-%time:~3,2%" ..\bat\* ..\bin\* .\vendor .\LICENSE.txt .\README.txt
pause
