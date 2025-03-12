# Raymond QMS Deployment Guide

This guide provides instructions for deploying the Raymond Quality Management System (QMS) application to various platforms.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Building the Application](#building-the-application)
3. [Deployment Options](#deployment-options)
   - [Option 1: Static Hosting (Netlify, Vercel, GitHub Pages)](#option-1-static-hosting-netlify-vercel-github-pages)
   - [Option 2: Traditional Web Hosting](#option-2-traditional-web-hosting)
   - [Option 3: Docker Deployment](#option-3-docker-deployment)
4. [Environment Configuration](#environment-configuration)
5. [Post-Deployment Steps](#post-deployment-steps)
6. [Troubleshooting](#troubleshooting)

## Prerequisites

Before deploying the application, ensure you have:

- Node.js (v14 or later) and npm installed
- Git for version control
- Access to your chosen hosting platform
- All dependencies installed (`npm install`)

## Building the Application

To create a production-ready build of the application:

1. Open a terminal in the project root directory
2. Run the build command:

```bash
npm run build
```

This will create a `build` folder containing optimized, minified files ready for deployment.

## Deployment Options

### Option 1: Static Hosting (Netlify, Vercel, GitHub Pages)

#### Netlify Deployment

1. Create an account on [Netlify](https://www.netlify.com/)
2. From the Netlify dashboard, click "New site from Git"
3. Connect to your Git repository (GitHub, GitLab, or Bitbucket)
4. Select the repository containing your Raymond QMS application
5. Configure build settings:
   - Build command: `npm run build`
   - Publish directory: `build`
6. Click "Deploy site"

Netlify will automatically build and deploy your application. It will provide a URL where your application is accessible.

#### Vercel Deployment

1. Create an account on [Vercel](https://vercel.com/)
2. Install the Vercel CLI: `npm install -g vercel`
3. Run `vercel login` and follow the authentication process
4. Navigate to your project directory and run `vercel`
5. Follow the prompts to configure your deployment
6. For subsequent deployments, use `vercel --prod`

#### GitHub Pages

1. Add `"homepage": "https://yourusername.github.io/raymond-qms"` to your package.json
2. Install GitHub Pages package: `npm install --save-dev gh-pages`
3. Add deployment scripts to package.json:
   ```json
   "scripts": {
     "predeploy": "npm run build",
     "deploy": "gh-pages -d build",
     ...
   }
   ```
4. Run `npm run deploy`

### Option 2: Traditional Web Hosting

1. Build the application using `npm run build`
2. Upload the contents of the `build` folder to your web server using FTP or your hosting provider's file manager
3. Configure your web server to serve the `index.html` file for all routes
   
For Apache, create a `.htaccess` file in the root directory with:

```
RewriteEngine On
RewriteBase /
RewriteRule ^index\.html$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.html [L]
```

For Nginx, add this to your server configuration:

```
location / {
  try_files $uri $uri/ /index.html;
}
```

### Option 3: Docker Deployment

1. Create a `Dockerfile` in the project root:

```Dockerfile
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
```

2. Create an `nginx.conf` file:

```
server {
  listen 80;
  location / {
    root /usr/share/nginx/html;
    index index.html index.htm;
    try_files $uri $uri/ /index.html =404;
  }
}
```

3. Build the Docker image:

```bash
docker build -t raymond-qms .
```

4. Run the container:

```bash
docker run -p 80:80 raymond-qms
```

## Environment Configuration

For environment-specific configurations:

1. Create `.env.production` file in the project root
2. Add environment variables prefixed with `REACT_APP_`:

```
REACT_APP_API_URL=https://your-api-url.com
REACT_APP_VERSION=1.0.0
```

These variables will be embedded during the build process.

## Post-Deployment Steps

After deploying the application:

1. Test all functionality in the production environment
2. Set up proper authentication if connecting to external services
3. Configure any necessary CORS settings if using external APIs
4. Set up monitoring and analytics (Google Analytics, etc.)
5. Create regular backup procedures for your data

## Troubleshooting

### Blank Page After Deployment

- Check if the `homepage` field in package.json is set correctly
- Verify that server routing is configured to handle client-side routing
- Check browser console for errors

### Missing Assets

- Ensure all asset paths are relative or use `%PUBLIC_URL%` prefix
- Check if the build process completed successfully

### API Connection Issues

- Verify that environment variables are set correctly
- Check CORS configuration on your API server
- Ensure API endpoints are accessible from your deployment environment

---

For additional support or questions, please refer to the project documentation or contact the development team. 