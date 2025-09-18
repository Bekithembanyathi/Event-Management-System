# VS Code Setup Guide for Event Management System

## Quick Setup

### Option 1: Open with VS Code Workspace
1. Open VS Code
2. File → Open Workspace from File
3. Select `event-management.code-workspace`

### Option 2: Open Folder
1. Open VS Code
2. File → Open Folder
3. Select the `Event-Management-System` folder

## First Time Setup

1. **Install Recommended Extensions**
   - VS Code will prompt you to install recommended extensions
   - Click "Install All" or install individually

2. **Set up Environment**
   ```bash
   cp .env.example .env
   # Edit .env with your actual configuration
   ```

3. **Install Dependencies**
   ```bash
   npm install
   ```

4. **Test the Setup**
   ```bash
   npm start
   ```

## Features Available

### 🐛 Debugging
- Press `F5` to start debugging
- Breakpoints will work in your JavaScript/TypeScript files
- Multiple debug configurations available

### 🔧 Tasks
- Press `Ctrl+Shift+P` → "Tasks: Run Task"
- Available tasks:
  - Build
  - Test
  - Start

### 📝 Code Quality
- **Auto-formatting** on save (Prettier)
- **Linting** with ESLint
- **Import organization** on save

### 🗂️ File Management
- **File nesting** for related files
- **Exclude** build artifacts from explorer
- **Path intellisense** for imports

## Adding Your Existing Code

### For Node.js/Express Projects
1. Copy your files to `src/` directory
2. Update `package.json` dependencies if needed
3. Update entry point in `package.json` if different

### For Frontend Projects
1. Copy HTML/CSS files to `assets/` directory
2. Copy JavaScript to `src/` directory
3. Update VS Code tasks for your build process

### For Full-Stack Projects
1. Organize backend code in `src/`
2. Organize frontend code in `assets/` or create separate directories
3. Update debug configurations for both frontend and backend

## Useful VS Code Shortcuts

- `F5` - Start debugging
- `Ctrl+Shift+P` - Command palette
- `Ctrl+` ` - Toggle terminal
- `Ctrl+Shift+E` - Explorer
- `Ctrl+Shift+G` - Source control
- `Ctrl+Shift+X` - Extensions

## Troubleshooting

### Extensions not working?
1. Check if extensions are installed
2. Reload VS Code window
3. Check extension requirements (Node.js version, etc.)

### Debugging not working?
1. Check that entry point exists (`src/index.js`)
2. Install dependencies (`npm install`)
3. Check debug configuration in `.vscode/launch.json`

### Formatting not working?
1. Ensure Prettier extension is installed
2. Check if `editor.formatOnSave` is enabled
3. Right-click → "Format Document With..." → Prettier

## Next Steps

1. **Configure your environment variables** in `.env`
2. **Start developing** your event management features
3. **Use the terminal** in VS Code for git commands
4. **Set up your database** connections
5. **Add your existing routes and models**

Happy coding! 🚀