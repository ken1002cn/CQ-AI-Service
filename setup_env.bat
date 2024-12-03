@echo off

REM 设置虚拟环境目录
set VENV_DIR=venv

REM 检查虚拟环境是否已经存在
IF EXIST %VENV_DIR% (
    echo Virtual environment "%VENV_DIR%" already exists. Skipping creation.
) ELSE (
    echo Creating virtual environment "%VENV_DIR%"...
    python -m venv %VENV_DIR%
    IF %ERRORLEVEL% NEQ 0 (
        echo Failed to create virtual environment.
        exit /b 1
    )
    echo Virtual environment created successfully.
)

REM 激活虚拟环境
echo Activating virtual environment...
call %VENV_DIR%\Scripts\activate.bat

REM 安装依赖
IF EXIST requirements.txt (
    echo Installing dependencies from requirements.txt...
    pip install -r requirements.txt
) ELSE (
    echo requirements.txt not found. Skipping dependency installation.
)

echo Virtual environment is now activated. You can start working on the project!
