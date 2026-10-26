@echo off
setlocal enabledelayedexpansion

set "PATH=C:\Users\archs\AppData\Local\Microsoft\WinGet\Packages\Git.MinGit_Microsoft.Winget.Source_8wekyb3d8bbwe\cmd;C:\Users\archs\AppData\Local\Microsoft\WinGet\Packages\Git.MinGit_Microsoft.Winget.Source_8wekyb3d8bbwe\ucrt64\bin;%PATH%"

cd /d "%~dp0"

echo =====================================================================
echo  Deploying Website to GitHub Pages (https://arch-sakhawat.github.io)
echo =====================================================================
echo.

if not exist ".git" (
    echo [1/4] Initializing Git repository...
    git init
    git branch -M main
    git remote add origin https://github.com/arch-sakhawat/arch-sakhawat.github.io.git
) else (
    echo [1/4] Git repository verified.
    git remote set-url origin https://github.com/arch-sakhawat/arch-sakhawat.github.io.git
)

echo.
echo [2/4] Staging website assets...
git add index.html README.md .gitignore assets/

echo.
echo [3/4] Committing changes...
git commit -m "Deploy official showcase and products portal for arch-sakhawat.github.io"

echo.
echo [4/4] Pushing to GitHub (origin main)...
git push -u origin main

echo.
echo =====================================================================
echo  Deployment complete!
echo  Visit: https://arch-sakhawat.github.io/
echo =====================================================================
echo.
pause
