@echo off
REM 修改Python下载地址为国内镜像站点
set PYTHON_DOWNLOAD_URL=https://mirrors.tuna.tsinghua.edu.cn/python/release/v3.11.0/python-3.11.0-amd64.exe

echo 正在下载Python 3.11.0...
powershell -Command "(New-Object Net.WebClient).DownloadFile('%PYTHON_DOWNLOAD_URL%', 'python-3.11.0-amd64.exe')"
echo 下载完成，正在安装Python 3.11.0...
start /wait python-3.11.0-amd64.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
echo 安装完成！
pause