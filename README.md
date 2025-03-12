# Raymond QMS - Quality Management System

A comprehensive quality management system designed for manufacturing companies to manage inspections, reports, and quality data.

## Overview

Raymond QMS is a web-based application that helps quality analysts perform inspections, track quality metrics, and manage product specifications. The application includes:

- Dashboard with quick access to key features
- Inspection forms for quality checks
- Reports and analytics
- Data management for products, suppliers, and specifications
- System settings and user management

## Deployment Guide for Non-Technical Users

This guide will help you deploy the Raymond QMS application so your quality analysts can access it. We'll cover both simple local deployment for testing and cloud deployment for production use.

### Option 1: Simple Local Deployment (For Testing)

This option is good for testing the application within your local network before deploying to production.

#### Prerequisites:
- A computer that will act as your server (Windows 10/11 recommended)
- Node.js installed (download from [nodejs.org](https://nodejs.org/))

#### Steps:

1. **Install Node.js**:
   - Download the "LTS" (Long Term Support) version from [nodejs.org](https://nodejs.org/)
   - Run the installer and follow the prompts (accept all defaults)
   - Verify installation by opening Command Prompt and typing: `node -v` and `npm -v`

2. **Prepare the Application**:
   - Extract the Raymond QMS files to a folder on your computer
   - Open Command Prompt and navigate to the folder (e.g., `cd C:\path\to\raymond-qms`)
   - Run: `npm install` (this installs all required dependencies)
   - Run: `npm run build` (this creates an optimized production build)

3. **Start the Server**:
   - Run: `npx serve -s build`
   - The application will be available at: http://localhost:3000
   - Other computers on your network can access it using your computer's IP address (e.g., http://192.168.1.100:3000)

4. **Share with Quality Analysts**:
   - Ensure your computer stays on while analysts need to use the system
   - Share the URL (your computer's IP address) with your team

### Option 2: Cloud Deployment (For Production)

For a more robust solution that's accessible from anywhere, deploy to a cloud service.

#### Using Netlify (Easiest Option):

1. **Create a Netlify Account**:
   - Go to [netlify.com](https://www.netlify.com/) and sign up for a free account

2. **Prepare Your Application**:
   - Compress your raymond-qms folder into a ZIP file

3. **Deploy to Netlify**:
   - Log in to Netlify
   - Go to the "Sites" section
   - Drag and drop your ZIP file onto the Netlify dashboard
   - Netlify will automatically extract, build, and deploy your site
   - You'll receive a URL like `random-name.netlify.app`

4. **Custom Domain (Optional)**:
   - In Netlify dashboard, go to "Domain settings"
   - Click "Add custom domain" and follow the instructions
   - This will allow you to use a domain like `qms.yourcompany.com`

5. **Share with Quality Analysts**:
   - Share the Netlify URL (or your custom domain) with your team
   - The application will be accessible 24/7 from anywhere with internet access

### Option 3: Professional Deployment

For a fully-featured production deployment with database integration and user authentication, we recommend:

1. **Hire a Developer**: Contract a web developer for a day to set up the application properly
2. **Use a Platform-as-a-Service**: Services like Heroku, Render, or DigitalOcean App Platform
3. **IT Department Setup**: If you have an IT department, ask them to deploy the application on your company servers

## User Guide for Quality Analysts

### Accessing the Application:
- Open a web browser (Chrome, Firefox, Edge recommended)
- Enter the URL provided by your administrator
- Log in with your credentials

### Using the Application:
1. **Dashboard**: The main screen provides quick access to all features
2. **New Inspection**: Create quality inspection reports
3. **Reports**: View and analyze quality data
4. **Data Management**: Manage products, suppliers, and specifications

## Support and Troubleshooting

If you encounter any issues:

1. **Application Not Loading**:
   - Check your internet connection
   - Verify the URL is correct
   - Try a different web browser

2. **Cannot Log In**:
   - Ensure caps lock is off
   - Reset your password using the "Forgot Password" link
   - Contact your administrator for account issues

3. **Data Not Saving**:
   - Check your internet connection
   - Try refreshing the page
   - Contact your administrator if the problem persists

## Contact

For additional support, please contact your system administrator or IT department.

## Features

- **Inspection Management**: Create, edit, and manage quality inspections
- **AQL Sampling**: Calculate sample sizes based on AQL 2.5% and other methods
- **Reporting**: Generate and export quality reports
- **Analytics**: Visualize quality data with PowerBI integration
- **User Management**: Role-based access control
- **Data Management**: Import/export functionality for quality data

## Getting Started

### Prerequisites

- Node.js (v14 or higher)
- npm (v6 or higher)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/raymond-qms.git
   cd raymond-qms
   ```

2. Install dependencies:
   ```
   npm install
   ```

### Running the Application

#### Using PowerShell

For PowerShell users, you can use one of the following methods:

1. **Simple Run Script**:
   ```
   .\run.ps1
   ```

2. **Interactive Menu**:
   ```
   .\start.ps1
   ```
   This will display a menu with various options including starting the development server, building for production, and deployment options.

#### Using Command Prompt (CMD)

For Command Prompt users, you can use one of the following methods:

1. **Simple Run Script**:
   ```
   run.bat
   ```

2. **Interactive Menu**:
   ```
   start.bat
   ```
   This will display a menu with various options including starting the development server, building for production, and deployment options.

#### Using npm Directly

You can also use npm commands directly:

1. **Start Development Server**:
   ```
   npm start
   ```

2. **Build for Production**:
   ```
   npm run build
   ```

3. **Deploy to GitHub Pages**:
   ```
   npm run deploy
   ```

## Deployment Options

### GitHub Pages

1. Update the `homepage` field in `package.json` to your GitHub Pages URL:
   ```json
   "homepage": "https://yourusername.github.io/raymond-qms"
   ```

2. Deploy using the PowerShell script, batch file, or directly with:
   ```
   npm run deploy
   ```

### Netlify

1. Build the application:
   ```
   npm run build
   ```

2. Deploy using the Netlify CLI:
   ```
   npx netlify deploy --prod
   ```

3. For continuous deployment, connect your GitHub repository to Netlify.

### Docker

1. Build the Docker image:
   ```
   docker build -t raymond-qms:latest .
   ```

2. Run the Docker container:
   ```
   docker run -d -p 8080:80 --name raymond-qms raymond-qms:latest
   ```

3. Access the application at http://localhost:8080

## Environment Variables

The application supports the following environment variables:

- `REACT_APP_STORAGE_PREFIX`: Prefix for localStorage keys (default: 'raymondQms')
- `REACT_APP_API_URL`: URL for the backend API (if applicable)
- `REACT_APP_VERSION`: Application version

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [React](https://reactjs.org/)
- [React Bootstrap](https://react-bootstrap.github.io/)
- [React Router](https://reactrouter.com/)
- [PowerBI](https://powerbi.microsoft.com/) 