#!/bin/bash

# Tailored Pics Website - Local Development Server
# This script sets up and runs the Jekyll site with Tailwind CSS

echo "🚀 Starting Tailored Pics Website Development Server..."

# Check if Ruby is installed
if ! command -v ruby &> /dev/null; then
    echo "❌ Ruby is not installed. Please install Ruby first."
    exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Install Ruby dependencies if Gemfile.lock doesn't exist
if [ ! -f "Gemfile.lock" ]; then
    echo "📦 Installing Ruby dependencies..."
    bundle install
fi

# Install Node.js dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo "📦 Installing Node.js dependencies..."
    npm install
fi

# Build CSS initially
echo "🎨 Building initial CSS..."
npm run build-css

# Start the development server
echo "🌐 Starting development server..."
echo "📍 Site will be available at: http://localhost:4000"
echo "⏹️  Press Ctrl+C to stop the server"
echo ""

# Run the development server with live reload
npm run dev