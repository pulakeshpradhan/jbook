@echo off
setlocal enabledelayedexpansion

:: Menu for easy project management
:menu
echo ======================================================
echo           OpenGIS Jupyter Book Manager
echo ======================================================
echo 1. Build Book Locally
echo 2. Preview Book in Browser
echo 3. Clean Build Folder
echo 4. Commit and Push to GitHub
echo 5. Install Dependencies (Jupyter Book)
echo 6. Exit
echo ======================================================
set /p choice="Select an option (1-6): "

if "%choice%"=="1" goto build
if "%choice%"=="2" goto preview
if "%choice%"=="3" goto clean
if "%choice%"=="4" goto push
if "%choice%"=="5" goto install
if "%choice%"=="6" goto end
goto menu

:build
echo Building Jupyter Book...
jupyter-book build .
pause
goto menu

:preview
if exist _build\html\index.html (
    echo Opening preview...
    start _build\html\index.html
) else (
    echo [ERROR] Build not found! Run the Build option first.
)
pause
goto menu

:clean
echo Cleaning build folder...
jupyter-book clean .
pause
goto menu

:push
set /p msg="Enter commit message: "
echo Adding changes...
git add .
echo Committing...
git commit -m "!msg!"
echo Pushing to main...
git push origin main
pause
goto menu

:install
echo Installing Jupyter Book...
pip install jupyter-book ghp-import
pause
goto menu

:end
echo Goodbye!
exit
