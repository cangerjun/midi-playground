@echo off

pip show pip | findstr "^Version:" > nul
if %errorlevel% neq 0 (
    python -m ensurepip --upgrade
) else (
    pip show pip | findstr "^Version:" > "current_version.txt"
    set /p current_version=<current_version.txt
    del current_version.txt
    echo 当前pip版本: %current_version%
    
    set target_version=24.2
    if "%current_version%" NEQ "Version: %target_version%" (
        python -m pip install --upgrade pip==%target_version%
    ) else (
        echo pip已经是最新版本(%target_version%)。
    )
)

set PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
set PIP_TRUSTED_HOST=pypi.tuna.tsinghua.edu.cn

pip install -r requirements.txt