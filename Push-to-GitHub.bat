@echo off
setlocal
cd /d "%~dp0"

where git >nul 2>&1
if errorlevel 1 (
  echo Git is not installed or not in PATH.
  echo Install Git for Windows from https://git-scm.com/download/win
  echo Then run this file again.
  pause
  exit /b 1
)

git remote get-url origin >nul 2>&1
if errorlevel 1 (
  git remote add origin https://github.com/NigelRodrick/Fidinsky-Tech-Solutions.git
)

git add -A
git status
git commit -m "Publish Fidinsky Tech Solutions website"
if errorlevel 1 (
  echo No commit created ^(nothing new or empty message^). Continuing to push if remote exists...
)

git branch -M main
git push -u origin main
if errorlevel 1 (
  echo.
  echo Push failed. Sign in to GitHub ^(browser or credential manager^) and try again.
  pause
  exit /b 1
)

echo.
echo Pushed to https://github.com/NigelRodrick/Fidinsky-Tech-Solutions
pause
