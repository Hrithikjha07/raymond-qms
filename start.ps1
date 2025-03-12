# Raymond QMS PowerShell Script
# This script provides a menu for various Raymond QMS operations

function Show-Header {
    Clear-Host
    Write-Host "====================================================" -ForegroundColor Cyan
    Write-Host "             RAYMOND QUALITY MANAGEMENT SYSTEM      " -ForegroundColor Cyan
    Write-Host "====================================================" -ForegroundColor Cyan
    Write-Host ""
}

function Start-DevServer {
    Show-Header
    Write-Host "Starting development server..." -ForegroundColor Green
    Write-Host "Current directory: $PWD" -ForegroundColor Yellow
    Write-Host ""
    npm start
}

function Build-Production {
    Show-Header
    Write-Host "Building for production..." -ForegroundColor Green
    Write-Host "Current directory: $PWD" -ForegroundColor Yellow
    Write-Host ""
    npm run build
    
    Write-Host ""
    Write-Host "Build completed. Files are in the 'build' directory." -ForegroundColor Green
    Write-Host "Press any key to return to the menu..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Deploy-GitHub {
    Show-Header
    Write-Host "Deploying to GitHub Pages..." -ForegroundColor Green
    Write-Host "Current directory: $PWD" -ForegroundColor Yellow
    Write-Host ""
    
    # Check if gh-pages package is installed
    $packageJson = Get-Content -Path "package.json" -Raw | ConvertFrom-Json
    if (-not ($packageJson.dependencies.PSObject.Properties.Name -contains "gh-pages" -or $packageJson.devDependencies.PSObject.Properties.Name -contains "gh-pages")) {
        Write-Host "Installing gh-pages package..." -ForegroundColor Yellow
        npm install --save-dev gh-pages
    }
    
    # Deploy to GitHub Pages
    npm run deploy
    
    Write-Host ""
    Write-Host "Deployment completed." -ForegroundColor Green
    Write-Host "Press any key to return to the menu..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Deploy-Netlify {
    Show-Header
    Write-Host "Deploying to Netlify..." -ForegroundColor Green
    Write-Host "Current directory: $PWD" -ForegroundColor Yellow
    Write-Host ""
    
    # Check if netlify-cli is installed
    $netlifyInstalled = $null
    try {
        $netlifyInstalled = Get-Command netlify -ErrorAction SilentlyContinue
    } catch {
        $netlifyInstalled = $null
    }
    
    if (-not $netlifyInstalled) {
        Write-Host "Installing Netlify CLI..." -ForegroundColor Yellow
        npm install -g netlify-cli
    }
    
    # Build the project
    npm run build
    
    # Deploy to Netlify
    netlify deploy --prod
    
    Write-Host ""
    Write-Host "Deployment completed." -ForegroundColor Green
    Write-Host "Press any key to return to the menu..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Build-Docker {
    Show-Header
    Write-Host "Building Docker image..." -ForegroundColor Green
    Write-Host "Current directory: $PWD" -ForegroundColor Yellow
    Write-Host ""
    
    # Check if Dockerfile exists
    if (-not (Test-Path "Dockerfile")) {
        Write-Host "Dockerfile not found. Creating a basic Dockerfile..." -ForegroundColor Yellow
        
        @"
FROM node:16-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
"@ | Out-File -FilePath "Dockerfile" -Encoding utf8
        
        # Create nginx.conf if it doesn't exist
        if (-not (Test-Path "nginx.conf")) {
            @"
server {
    listen 80;
    server_name localhost;
    root /usr/share/nginx/html;
    index index.html;
    
    location / {
        try_files \$uri \$uri/ /index.html;
    }
}
"@ | Out-File -FilePath "nginx.conf" -Encoding utf8
        }
    }
    
    # Build Docker image
    docker build -t raymond-qms:latest .
    
    Write-Host ""
    Write-Host "Docker image built successfully." -ForegroundColor Green
    Write-Host "Press any key to return to the menu..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Run-Docker {
    Show-Header
    Write-Host "Running Docker container..." -ForegroundColor Green
    Write-Host "Current directory: $PWD" -ForegroundColor Yellow
    Write-Host ""
    
    # Check if image exists
    $imageExists = docker images -q raymond-qms:latest
    
    if (-not $imageExists) {
        Write-Host "Docker image not found. Building image first..." -ForegroundColor Yellow
        Build-Docker
    }
    
    # Stop any existing container
    docker stop raymond-qms 2>$null
    docker rm raymond-qms 2>$null
    
    # Run container
    docker run -d -p 8080:80 --name raymond-qms raymond-qms:latest
    
    Write-Host ""
    Write-Host "Docker container is running." -ForegroundColor Green
    Write-Host "Access the application at http://localhost:8080" -ForegroundColor Cyan
    Write-Host "Press any key to return to the menu..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

function Show-Menu {
    Show-Header
    Write-Host "Please select an option:" -ForegroundColor White
    Write-Host ""
    Write-Host "1. Start Development Server" -ForegroundColor Green
    Write-Host "2. Build for Production" -ForegroundColor Green
    Write-Host "3. Deploy to GitHub Pages" -ForegroundColor Green
    Write-Host "4. Deploy to Netlify" -ForegroundColor Green
    Write-Host "5. Build Docker Image" -ForegroundColor Green
    Write-Host "6. Run Docker Container" -ForegroundColor Green
    Write-Host "0. Exit" -ForegroundColor Red
    Write-Host ""
    Write-Host "Enter your choice: " -ForegroundColor Yellow -NoNewline
}

# Main menu loop
$choice = ""
while ($choice -ne "0") {
    Show-Menu
    $choice = Read-Host
    
    switch ($choice) {
        "1" { Start-DevServer }
        "2" { Build-Production }
        "3" { Deploy-GitHub }
        "4" { Deploy-Netlify }
        "5" { Build-Docker }
        "6" { Run-Docker }
        "0" { 
            Clear-Host
            Write-Host "Thank you for using Raymond QMS!" -ForegroundColor Cyan
            Write-Host ""
            break
        }
        default {
            Write-Host "Invalid option. Please try again." -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
} 