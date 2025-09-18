# Event Management System

A comprehensive event management system for organizing and managing events efficiently.

## 🚀 Getting Started

### Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Bekithembanyathi/Event-Management-System.git
   cd Event-Management-System
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

4. **Start the development server**
   ```bash
   npm run dev
   ```

## 📁 Project Structure

```
Event-Management-System/
├── src/                    # Source code
│   ├── index.js           # Main entry point
│   ├── routes/            # API routes
│   ├── models/            # Data models
│   ├── controllers/       # Business logic
│   ├── middleware/        # Custom middleware
│   └── utils/             # Utility functions
├── assets/                # Static assets
├── docs/                  # Documentation
├── tests/                 # Test files
├── config/                # Configuration files
├── .vscode/               # VS Code settings
├── .gitignore            # Git ignore rules
├── package.json          # Project dependencies
└── README.md             # This file
```

## 🛠️ Development

### VS Code Setup

This project is optimized for VS Code with:

- **Recommended extensions** - Install suggested extensions when prompted
- **Debug configurations** - Press F5 to start debugging
- **Tasks** - Use Ctrl+Shift+P > "Tasks: Run Task" for build/test tasks
- **Settings** - Pre-configured formatting and editor settings

### Available Scripts

- `npm start` - Run the production server
- `npm run dev` - Run the development server with hot reload
- `npm run build` - Build the project for production
- `npm test` - Run tests
- `npm run test:watch` - Run tests in watch mode
- `npm run lint` - Lint the code
- `npm run lint:fix` - Fix linting issues automatically
- `npm run format` - Format code with Prettier

### Adding Your Existing Code

1. **Copy your existing files** to the appropriate directories:
   - JavaScript/Node.js files → `src/`
   - Static files (HTML, CSS, images) → `assets/`
   - Tests → `tests/`

2. **Update package.json** if your project has different dependencies

3. **Configure environment variables** in `.env` file

4. **Update the entry point** in `package.json` if different from `src/index.js`

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the root directory:

```env
PORT=3000
NODE_ENV=development
DATABASE_URL=your_database_url
API_KEY=your_api_key
```

### VS Code Workspace

Open the project in VS Code:
```bash
code .
```

The workspace is pre-configured with:
- Debugging setup for Node.js and TypeScript
- Recommended extensions for web development
- Code formatting and linting rules
- File nesting for better organization

## 📝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Support

If you have any questions or need help, please:

1. Check the [documentation](docs/)
2. Search existing [issues](https://github.com/Bekithembanyathi/Event-Management-System/issues)
3. Create a new issue if needed

## 🌟 Features

- [ ] Event creation and management
- [ ] User authentication and authorization
- [ ] Event registration and ticketing
- [ ] Calendar integration
- [ ] Notification system
- [ ] Reporting and analytics
- [ ] Mobile responsive design

---

Made with ❤️ for event management
