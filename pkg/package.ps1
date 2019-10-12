Set-Location (Split-Path -Parent $MyInvocation.MyCommand.Definition)
cd..
7za a .\pkg\toolkit .\src\视频* .\pkg\ffmpeg.exe .\pkg\logo.png
