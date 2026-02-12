@echo off
setlocal enabledelayedexpansion

:: Menu for easy project management
:menu
cls
echo ======================================================
echo           OpenGIS Jupyter Book Manager
echo ======================================================
echo  1. Build Book Locally
echo  2. Preview Book in Browser
echo  3. Build ^& Publish to GitHub Pages (gh-pages)
echo  4. Commit ^& Push Source Code (main)
echo  5. Clean Build Folder
echo  6. Install Dependencies (JB + ghp-import)
echo  7. Exit
echo ======================================================
set /p choice="Select an option (1-7): "

if "%choice%"=="1" goto build
if "%choice%"=="2" goto preview
if "%choice%"=="3" goto publish
if "%choice%"=="4" goto push
if "%choice%"=="5" goto clean
if "%choice%"=="6" goto install
if "%choice%"=="7" goto end
goto menu

:build
echo.
echo [INFO] Building Jupyter Book...
jupyter-book build .
echo.
pause
goto menu

:preview
echo.
if exist _build\html\index.html (
    echo [INFO] Opening preview in browser...
    start _build\html\index.html
) else (
    echo [ERROR] Build not found! Please run option 1 (Build) first.
)
echo.
pause
goto menu

:publish
echo.
echo [INFO] Step 1: Building Book...
jupyter-book build .
if %errorlevel% neq 0 (
    echo [ERROR] Build failed. Aborting publish.
    pause
    goto menu
)
echo.
echo [INFO] Step 2: Publishing to gh-pages branch...
ghp-import -n -p -f _build/html
if %errorlevel% neq 0 (
    echo [ERROR] Publish failed.
) else (
    echo [SUCCESS] Site published successfully!
    echo Check: https://pulakeshpradhan.github.io/jbook/
)
echo.
pause
goto menu

:push
echo.
set /p msg="Enter commit message for source: "
if "!msg!"=="" set msg="Update documentation source"
echo [INFO] Staging files...
git add .
echo [INFO] Committing changes...
git commit -m "!msg!"
echo [INFO] Pushing to origin main...
git push origin main
echo.
pause
goto menu

:clean
echo.
echo [INFO] Cleaning build folder and cache...
jupyter-book clean .
echo.
pause
goto menu

:install
echo.
echo [INFO] Installing required libraries...
pip install jupyter-book ghp-import
echo.
pause
goto menu

:end
echo.
echo Goodbye!
timeout /t 2 >nul
exit
