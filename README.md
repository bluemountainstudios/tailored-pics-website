# Tailored Pics Marketing Website

A Jekyll-powered marketing website for the Tailored Pics iOS app, built with Tailwind CSS for modern, responsive design.

## 🚀 Quick Start

### Prerequisites

- Ruby (version 3.0 or higher recommended)
- Node.js and npm
- Git

### Local Development

1. **Clone and navigate to the project:**
   ```bash
   cd tailored-pics-website
   ```

2. **Install Ruby dependencies:**
   ```bash
   bundle install
   ```

3. **Install Node.js dependencies:**
   ```bash
   npm install
   ```

4. **Start the development server:**
   ```bash
   npm run dev
   ```
   
   This command will:
   - Start Tailwind CSS in watch mode
   - Launch Jekyll with live reload
   - Open the site at `http://localhost:4000`

### Build for Production

```bash
npm run build
```

This creates a production-ready build in the `_site` directory.

## 🌐 GitHub Pages Deployment

The site is configured to work seamlessly with GitHub Pages:

### Automatic Deployment

1. **Push to main branch:**
   ```bash
   git push origin main
   ```

2. **Enable GitHub Pages:**
   - Go to your repository settings
   - Navigate to "Pages" section
   - Select "Deploy from a branch"
   - Choose "main" branch and "/ (root)" folder
   - Click "Save"

3. **GitHub Actions (Optional):**
   For more control, create `.github/workflows/pages.yml`:
   ```yaml
   name: Build and Deploy to Pages
   
   on:
     push:
       branches: ["main"]
     workflow_dispatch:
   
   permissions:
     contents: read
     pages: write
     id-token: write
   
   concurrency:
     group: "pages"
     cancel-in-progress: false
   
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         - name: Checkout
           uses: actions/checkout@v4
         
         - name: Setup Ruby
           uses: ruby/setup-ruby@v1
           with:
             ruby-version: '3.1'
             bundler-cache: true
             
         - name: Setup Node
           uses: actions/setup-node@v4
           with:
             node-version: '18'
             cache: npm
             
         - name: Install dependencies
           run: npm ci
           
         - name: Build CSS
           run: npm run build-css
           
         - name: Setup Pages
           uses: actions/configure-pages@v4
           
         - name: Build with Jekyll
           run: bundle exec jekyll build --baseurl "${{ steps.pages.outputs.base_path }}"
           env:
             JEKYLL_ENV: production
             
         - name: Upload artifact
           uses: actions/upload-pages-artifact@v3
   
     deploy:
       environment:
         name: github-pages
         url: ${{ steps.deployment.outputs.page_url }}
       runs-on: ubuntu-latest
       needs: build
       steps:
         - name: Deploy to GitHub Pages
           id: deployment
           uses: actions/deploy-pages@v4
   ```

## 📁 Project Structure

```
tailored-pics-website/
├── _config.yml              # Jekyll configuration
├── _layouts/                # Page layouts
│   └── default.html
├── _includes/               # Reusable components
│   ├── header.html
│   └── footer.html
├── _pages/                  # Static pages
│   ├── privacy.md
│   ├── terms.md
│   └── support.md
├── assets/
│   ├── css/
│   │   ├── input.css        # Tailwind source
│   │   └── main.css         # Generated CSS
│   └── images/
│       └── bms_images/      # Blue Mountain Studios symbols
├── index.html               # Homepage
├── Gemfile                  # Ruby dependencies
├── package.json             # Node.js dependencies
└── tailwind.config.js       # Tailwind configuration
```

## 🎨 Design System

### Colors
- **Primary Blue:** `#007AFF` (accent)
- **Light Blue:** `#5AC8FA` (accent-brightened)
- **Gradients:** Radial gradients from light to dark blue

### Typography
- **Font Family:** SF Pro Rounded, ui-rounded, system-ui
- **Headings:** Bold, large sizes with good contrast
- **Body:** Clean, readable text with appropriate line spacing

### Components
- **Glass Effect:** Backdrop blur with white transparency
- **Buttons:** Rounded, with hover states
- **Cards:** Rounded corners with consistent padding
- **Navigation:** Clean, responsive header with mobile menu

## 🔧 Available Scripts

- `npm run dev` - Start development server with live reload
- `npm run build` - Build for production
- `npm run build-css` - Build CSS only
- `npm run watch-css` - Watch CSS changes only

## 📱 Responsive Design

The website is fully responsive and tested on:
- Mobile devices (320px+)
- Tablets (768px+)
- Desktop (1024px+)
- Large screens (1280px+)

## 🎯 SEO Features

- Semantic HTML structure
- Meta descriptions and Open Graph tags
- Sitemap generation
- Clean URLs with Jekyll's pretty permalinks
- Fast loading with optimized CSS

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally with `npm run dev`
5. Submit a pull request

## 📧 Support

For questions about the website or development setup:
- Email: hello@bluemountainstudios.net
- Create an issue in the repository

## 📄 License

This website is proprietary to Blue Mountain Studios. The Tailored Pics app and associated marketing materials are not open source.
