@echo off
echo Raymond QMS Deployment Helper
echo ============================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
  echo ERROR: Node.js is not installed.
  echo Please install Node.js from https://nodejs.org/
  echo Choose the LTS (Long Term Support) version.
  echo.
  echo After installing Node.js, run this script again.
  pause
  exit /b 1
)

echo Node.js is installed. Proceeding with deployment...
echo.

REM Check if the build folder exists
if not exist "build\" (
  echo Building the application...
  echo This may take a few minutes...
  echo.
  call npm install
  call npm run build
  
  if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERROR: Build failed.
    echo Please contact technical support.
    pause
    exit /b 1
  )
) else (
  echo Build folder already exists. Skipping build step.
)

echo.
echo Starting the server...
echo.
echo When the server starts, you can access the application at:
echo http://localhost:3000
echo.
echo To share with others on your network, they can use:
echo http://%COMPUTERNAME%:3000
echo.
echo Press Ctrl+C to stop the server when you're done.
echo.
npx serve -s build

pause 