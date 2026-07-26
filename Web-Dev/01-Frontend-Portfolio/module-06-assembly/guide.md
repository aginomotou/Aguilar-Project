# Module 06 — Assembly & Vercel Deploy

## Learning Objective
After this module, you should be able to assemble your portfolio from all previous modules and deploy it to Vercel.

## Vercel Deployment Guide

### Step 1 — Prepare Your Project
1. Make sure your project is in a Git repository (init if needed):
   ```bash
   git init
   git add .
   git commit -m "Prepare portfolio for deployment"
   ```
2. Push to GitHub (create a new repo on GitHub, then):
   ```bash
   git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
   git push -u origin master
   ```

### Step 2 — Deploy to Vercel
1. Go to [vercel.com](https://vercel.com) and sign up/in with your GitHub account.
2. Click **Add New Project** → **Import Git Repository**.
3. Select your portfolio repository.
4. Vercel will auto-detect the project is static HTML/CSS/JS. No build command or output directory is needed.
5. Click **Deploy**.
6. Your portfolio is now live at `your-project-name.vercel.app`.

### Step 3 — Custom Domain (Optional)
1. In your Vercel project dashboard, go to **Settings** → **Domains**.
2. Add your custom domain and follow DNS verification instructions.

### Step 4 — Verify
1. Open your Vercel URL in a browser.
2. Test on mobile (use browser DevTools device toggle).
3. Check that all links, forms, and animations work.
4. Run the W3C validator on your HTML.

## Task
1. Assemble all module work into a single cohesive portfolio site in the `projects/` folder or your fork root.
2. Ensure all CSS and JS files are linked correctly.
3. Push to GitHub.
4. Deploy to Vercel.
5. Submit your Vercel URL.

### Acceptance Criteria
- Portfolio is live on Vercel and accessible via URL.
- All 5 previous modules' work is integrated into one site.
- Site renders correctly on mobile and desktop.
- Form validation works.
- Animations and interactivity all function.
- No console errors in browser DevTools.

## Stretch Goal
- Add a `vercel.json` config file with custom headers or redirects for your portfolio