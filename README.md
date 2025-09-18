# Event Management System

A comprehensive event management system for organizing, managing, and tracking events. This project provides a complete foundation for building an event management platform with user registration, event creation, payment processing, and attendee management.

## 🚀 Quick Start

### Prerequisites
- Node.js (v16 or higher)
- npm or yarn
- Database (PostgreSQL, MySQL, or MongoDB)
- Git

### Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/Bekithembanyathi/Event-Management-System.git
   cd Event-Management-System
   ```

2. **Open in VS Code**
   ```bash
   code .
   # Or open the workspace file:
   code .vscode/workspace.code-workspace
   ```

3. **Install dependencies**
   ```bash
   npm run install:all
   # Or manually:
   npm install
   cd frontend && npm install
   cd ../backend && npm install
   ```

4. **Environment Configuration**
   ```bash
   cp .env.example .env
   # Edit .env with your actual configuration values
   ```

5. **Database Setup**
   - Create your database
   - Run the schema file: `database/schemas/postgresql.sql`
   - Update database connection in `.env`

6. **Start Development**
   ```bash
   npm run dev
   # This starts both frontend and backend in development mode
   ```

## 📁 Project Structure

```
Event-Management-System/
├── frontend/               # Frontend application
│   ├── src/               # Source code
│   ├── public/            # Static files
│   ├── components/        # Reusable components
│   ├── pages/            # Page components
│   ├── styles/           # Stylesheets
│   └── assets/           # Images, fonts, etc.
├── backend/              # Backend API
│   ├── src/              # Source code
│   ├── routes/           # API routes
│   ├── models/           # Data models
│   ├── controllers/      # Route controllers
│   ├── middleware/       # Custom middleware
│   └── utils/            # Utility functions
├── database/             # Database related files
│   ├── schemas/          # Database schemas
│   ├── migrations/       # Database migrations
│   └── seeders/          # Sample data
├── docs/                 # Documentation
├── config/               # Configuration files
├── scripts/              # Build and deployment scripts
├── tests/                # Test files
│   ├── unit/             # Unit tests
│   ├── integration/      # Integration tests
│   └── e2e/              # End-to-end tests
└── assets/               # Shared assets
```

## 🛠 Available Scripts

```bash
# Install all dependencies
npm run install:all

# Development
npm run dev              # Start both frontend and backend
npm run dev:frontend     # Start only frontend
npm run dev:backend      # Start only backend

# Building
npm run build           # Build both frontend and backend
npm run build:frontend  # Build only frontend
npm run build:backend   # Build only backend

# Production
npm start              # Start production server
npm run start:frontend # Start frontend production server
npm run start:backend  # Start backend production server

# Testing
npm test              # Run all tests
npm run test:frontend # Run frontend tests
npm run test:backend  # Run backend tests

# Code Quality
npm run lint          # Lint all code
npm run lint:fix      # Fix linting issues
```

## 🎯 Key Features

- **Event Creation & Management**
  - Create, edit, and delete events
  - Event categories and tags
  - Event scheduling and calendar integration
  - Venue and location management

- **User Management**
  - User registration and authentication
  - Role-based access control (attendee, organizer, admin)
  - User profiles and preferences

- **Registration System**
  - Event registration and ticketing
  - Payment processing integration
  - Registration status tracking
  - Waitlist management

- **Communication**
  - Email notifications
  - Event reminders
  - Feedback and rating system

- **Analytics & Reporting**
  - Event attendance tracking
  - Registration analytics
  - Revenue reporting
  - User engagement metrics

## 🔧 Adding Your Existing Code

### For Frontend Code:
1. Place your frontend files in the `frontend/` directory
2. Update `frontend/package.json` with your dependencies
3. Modify the scripts in the root `package.json` if needed

### For Backend Code:
1. Place your backend files in the `backend/` directory
2. Update `backend/package.json` with your dependencies
3. Update environment variables in `.env`

### For Database:
1. Add your database schemas to `database/schemas/`
2. Add migrations to `database/migrations/`
3. Update the database configuration

## 🚀 VS Code Setup

This project includes VS Code configuration for optimal development:

- **Recommended Extensions**: Automatically suggested when you open the project
- **Workspace Settings**: Consistent formatting and linting
- **Tasks**: Pre-configured build and development tasks
- **Launch Configurations**: Debug configurations for both frontend and backend

### Opening the Project:
```bash
# Option 1: Open folder
code .

# Option 2: Open workspace (recommended)
code .vscode/workspace.code-workspace
```

## 📚 Technology Stack

### Frontend Options:
- Vanilla HTML/CSS/JavaScript (included)
- React.js
- Vue.js
- Angular
- Svelte

### Backend Options:
- Node.js with Express
- Node.js with Fastify
- Python with Django/Flask
- PHP with Laravel
- Java with Spring Boot
- C# with ASP.NET Core

### Database Options:
- PostgreSQL (recommended)
- MySQL
- MongoDB
- SQLite

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

If you encounter any issues or need help:

1. Check the [documentation](docs/)
2. Search existing [issues](https://github.com/Bekithembanyathi/Event-Management-System/issues)
3. Create a new issue if needed

## 🗺 Roadmap

- [ ] Mobile app development
- [ ] Advanced analytics dashboard
- [ ] Integration with popular calendar apps
- [ ] Multi-language support
- [ ] Advanced reporting features
- [ ] Social media integration
