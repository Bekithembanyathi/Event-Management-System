#!/bin/bash

# Event Management System - Development Setup Script

echo "🚀 Setting up Event Management System for development..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js v16 or higher."
    exit 1
fi

echo "✅ Node.js found: $(node --version)"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm."
    exit 1
fi

echo "✅ npm found: $(npm --version)"

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating .env file from template..."
    cp .env.example .env
    echo "⚠️  Please edit .env file with your actual configuration values"
else
    echo "✅ .env file already exists"
fi

# Install root dependencies
echo "📦 Installing root dependencies..."
npm install

# Install frontend dependencies
if [ -d "frontend" ]; then
    echo "📦 Installing frontend dependencies..."
    cd frontend
    if [ -f "package.json" ]; then
        npm install
    else
        echo "⚠️  No package.json found in frontend directory"
    fi
    cd ..
fi

# Install backend dependencies
if [ -d "backend" ]; then
    echo "📦 Installing backend dependencies..."
    cd backend
    if [ -f "package.json" ]; then
        npm install
    else
        echo "⚠️  No package.json found in backend directory"
    fi
    cd ..
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "1. Edit .env file with your configuration"
echo "2. Set up your database using the schema in database/schemas/"
echo "3. Run 'npm run dev' to start development servers"
echo "4. Open project in VS Code: 'code .'"
echo ""
echo "Happy coding! 🚀"