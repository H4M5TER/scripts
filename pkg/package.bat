chcp 65001
cd /D %~dp0
7za a .\toolkit_%date:~0,4%-%date:~5,2%-%date:~8,2%-%time:~0,2%-%time:~3,2% ..\bat\视频* .\vendor .\LICENSE.txt .\README.txt
pause
