@echo off
echo Raymond QMS Reset Tool
echo =======================
echo.
echo This tool will clear your browser's local storage data for the Raymond QMS application.
echo Use this if you're experiencing login issues or other unexpected behavior.
echo.
echo Press any key to continue or Ctrl+C to cancel...
pause > nul

echo.
echo Stopping any running servers...
taskkill /f /im node.exe > nul 2>&1

echo.
echo Clearing application data...
echo.
echo 1. Please open your browser
echo 2. Navigate to the Raymond QMS application (http://localhost:3000)
echo 3. Press F12 to open developer tools
echo 4. Go to the "Application" tab
echo 5. Select "Local Storage" on the left
echo 6. Right-click and select "Clear"
echo 7. Close the developer tools
echo.
echo After completing these steps, restart the application using deploy.bat
echo.
echo Press any key to exit...
pause > nul 