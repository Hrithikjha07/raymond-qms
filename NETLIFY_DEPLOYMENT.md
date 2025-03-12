# Deploying Raymond QMS to Netlify

This guide provides detailed, step-by-step instructions for deploying the Raymond QMS application to Netlify, making it accessible online for your quality analysts.

## What is Netlify?

Netlify is a web hosting service that makes it easy to deploy web applications without technical knowledge. The free tier is sufficient for most small to medium-sized companies.

## Preparation

Before starting, you'll need:

1. The Raymond QMS application files
2. A computer with internet access
3. About 15-20 minutes of time

## Step-by-Step Deployment Guide

### Step 1: Create a Netlify Account

1. Open your web browser and go to [netlify.com](https://www.netlify.com/)
2. Click the "Sign up" button
3. Choose to sign up with your email or with GitHub/GitLab/Bitbucket
4. Complete the registration process

### Step 2: Prepare Your Application Files

1. Make sure you have the complete Raymond QMS application folder on your computer
2. Open a command prompt or terminal in the application folder
3. Run the following commands:
   ```
   npm install
   npm run build
   ```
4. This will create a `build` folder with the production-ready application

### Step 3: Deploy to Netlify

#### Option A: Drag and Drop (Easiest)

1. Log in to your Netlify account
2. Go to the "Sites" section of your Netlify dashboard
3. Locate the `build` folder on your computer
4. Drag and drop the entire `build` folder onto the Netlify dashboard where it says "Drag and drop your site folder here"
5. Wait for the upload to complete (usually less than a minute)

#### Option B: Using the Netlify CLI (More Advanced)

1. Install the Netlify CLI by running: `npm install -g netlify-cli`
2. Log in to Netlify from the command line: `netlify login`
3. In the Raymond QMS folder, run: `netlify deploy --prod`
4. Follow the prompts, specifying `build` as your publish directory

### Step 4: Configure Your Site

1. Once deployed, Netlify will assign a random subdomain like `random-name-123456.netlify.app`
2. To change this to something more memorable:
   - Go to "Site settings" in your Netlify dashboard
   - Click "Change site name"
   - Enter a more appropriate name like `raymond-qms`
   - Your site will now be available at `raymond-qms.netlify.app`

### Step 5: Set Up a Custom Domain (Optional)

If you want to use your own domain (like `qms.yourcompany.com`):

1. In your Netlify site dashboard, go to "Domain settings"
2. Click "Add custom domain"
3. Enter your domain name and click "Verify"
4. Follow the instructions to configure your domain's DNS settings
   - This typically involves adding CNAME records at your domain registrar
   - Netlify provides detailed instructions for this process

### Step 6: Share with Your Team

1. Share the Netlify URL (or your custom domain) with your quality analysts
2. They can access the application from any device with a web browser and internet connection
3. No installation is required on their devices

## Updating Your Application

When you need to update the application:

1. Make the necessary changes to your application files
2. Run `npm run build` again to create an updated build folder
3. Drag and drop the updated build folder to Netlify, or use `netlify deploy --prod` if using the CLI
4. Netlify will automatically update your site

## Troubleshooting

### Common Issues

1. **Upload Failed**: 
   - Ensure your internet connection is stable
   - Try uploading a smaller portion of files at a time

2. **Site Not Loading**:
   - Check if the build process completed successfully
   - Verify that the build folder contains an `index.html` file

3. **Custom Domain Not Working**:
   - DNS changes can take up to 48 hours to propagate
   - Double-check your DNS settings against Netlify's instructions

### Getting Help

If you encounter issues not covered here:

1. Netlify has excellent documentation at [docs.netlify.com](https://docs.netlify.com/)
2. Their support team can be reached through your Netlify dashboard

## Additional Resources

- [Netlify Documentation](https://docs.netlify.com/)
- [Custom Domain Setup Guide](https://docs.netlify.com/domains-https/custom-domains/)
- [Netlify Forms](https://docs.netlify.com/forms/setup/) - If you want to add contact forms 