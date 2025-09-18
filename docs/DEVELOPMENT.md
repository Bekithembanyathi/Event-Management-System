# Development Setup Guide

## Getting Started with Your Existing Code

### Step 1: Organize Your Code
Based on your existing codebase, organize files into the appropriate directories:

**Frontend Code:**
- HTML files → `frontend/public/` or `frontend/pages/`
- CSS files → `frontend/styles/`
- JavaScript files → `frontend/src/`
- Images/assets → `frontend/assets/`
- Components → `frontend/components/`

**Backend Code:**
- API files → `backend/routes/`
- Database models → `backend/models/`
- Business logic → `backend/controllers/`
- Utilities → `backend/utils/`
- Configuration → `config/`

### Step 2: Update Package Dependencies
1. Review your existing `package.json` files
2. Merge dependencies with the ones in this project
3. Run `npm install` in appropriate directories

### Step 3: Environment Configuration
1. Copy `.env.example` to `.env`
2. Fill in your actual configuration values:
   ```
   DB_HOST=your_database_host
   DB_USER=your_database_user
   DB_PASSWORD=your_database_password
   JWT_SECRET=your_jwt_secret
   ```

### Step 4: Database Integration
1. If you have existing database:
   - Export your schema and import to `database/schemas/`
   - Update connection strings in `.env`
2. If starting fresh:
   - Use the provided PostgreSQL schema
   - Customize as needed for your requirements

### Step 5: VS Code Configuration
1. Open the project in VS Code: `code .`
2. Install recommended extensions when prompted
3. Configure any additional extensions for your tech stack

## Common Integration Patterns

### React.js Frontend
```bash
cd frontend
npx create-react-app . --template typescript
# Move your React components to src/components/
# Update package.json scripts
```

### Express.js Backend
```bash
cd backend
npm install express cors helmet morgan
# Update src/index.js with Express setup
# Move your routes to routes/ directory
```

### Database Integration
```javascript
// Example for PostgreSQL
const { Pool } = require('pg');
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});
```

## Testing Your Integration

### Frontend Testing
```bash
npm run dev:frontend
# Visit http://localhost:3001 (or your configured port)
```

### Backend Testing
```bash
npm run dev:backend
# Test API endpoints at http://localhost:3000
```

### Full Stack Testing
```bash
npm run dev
# Tests both frontend and backend together
```

## Troubleshooting

### Common Issues:
1. **Port conflicts**: Update ports in package.json scripts
2. **Database connection**: Check .env configuration
3. **Missing dependencies**: Run `npm install` in each directory
4. **Path issues**: Ensure all imports use correct relative paths

### Getting Help:
1. Check the main README.md
2. Review the sample code in this project
3. Create an issue on GitHub if you need assistance