@echo off
title Raymond Quality Management System
color 0B

:menu
cls
echo ====================================================
echo             RAYMOND QUALITY MANAGEMENT SYSTEM      
echo ====================================================
echo.
echo Current directory: %CD%
echo.
echo Please select an option:
echo.
echo 1. Start Development Server
echo 2. Build for Production
echo 3. Deploy to GitHub Pages
echo 4. Deploy to Netlify
echo 5. Build Docker Image
echo 6. Run Docker Container
echo 0. Exit
echo.
set /p choice=Enter your choice: 

if "%choice%"=="1" goto start
if "%choice%"=="2" goto build
if "%choice%"=="3" goto deploy_github
if "%choice%"=="4" goto deploy_netlify
if "%choice%"=="5" goto build_docker
if "%choice%"=="6" goto run_docker
if "%choice%"=="0" goto exit
echo Invalid option. Please try again.
timeout /t 2 >nul
goto menu

:start
cls
echo ====================================================
echo             STARTING DEVELOPMENT SERVER      
echo ====================================================
echo.
echo Current directory: %CD%
echo.
call npm start
goto menu

:build
cls
echo ====================================================
echo             BUILDING FOR PRODUCTION      
echo ====================================================
echo.
echo Current directory: %CD%
echo.
call npm run build
echo.
echo Build completed. Files are in the 'build' directory.
echo.
pause
goto menu

:deploy_github
cls
echo ====================================================
echo             DEPLOYING TO GITHUB PAGES      
echo ====================================================
echo.
echo Current directory: %CD%
echo.
call npm run deploy
echo.
echo Deployment completed.
echo.
pause
goto menu

:deploy_netlify
cls
echo ====================================================
echo             DEPLOYING TO NETLIFY      
echo ====================================================
echo.
echo Current directory: %CD%
echo.
call npm run build
call npx netlify deploy --prod
echo.
echo Deployment completed.
echo.
pause
goto menu

:build_docker
cls
echo ====================================================
echo             BUILDING DOCKER IMAGE      
echo ====================================================
echo.
echo Current directory: %CD%
echo.
docker build -t raymond-qms:latest .
echo.
echo Docker image built successfully.
echo.
pause
goto menu

:run_docker
cls
echo ====================================================
echo             RUNNING DOCKER CONTAINER      
echo ====================================================
echo.
echo Current directory: %CD%
echo.
docker stop raymond-qms 2>nul
docker rm raymond-qms 2>nul
docker run -d -p 8080:80 --name raymond-qms raymond-qms:latest
echo.
echo Docker container is running.
echo Access the application at http://localhost:8080
echo.
pause
goto menu

:exit
cls
echo Thank you for using Raymond QMS!
echo.
timeout /t 2 >nul
exit 