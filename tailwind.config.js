/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./_layouts/**/*.html",
    "./_includes/**/*.html", 
    "./_pages/**/*.html",
    "./_posts/**/*.md",
    "./index.html",
    "./assets/**/*.js"
  ],
  theme: {
    extend: {
      colors: {
        'accent': '#5447A1',
        'accent-brightened': '#9D95D0'
      },
      fontFamily: {
        'rounded': ['ui-rounded', 'SF Pro Rounded', 'system-ui', 'sans-serif']
      },
      backgroundImage: {
        'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}