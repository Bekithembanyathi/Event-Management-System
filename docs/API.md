# API Documentation

## Base URL
```
http://localhost:3000/api
```

## Authentication
Most endpoints require authentication. Include the JWT token in the Authorization header:
```
Authorization: Bearer <your-jwt-token>
```

## Events API

### Get All Events
```http
GET /api/events
```

**Query Parameters:**
- `page` (optional): Page number for pagination
- `limit` (optional): Number of events per page
- `category` (optional): Filter by category
- `status` (optional): Filter by status (active, cancelled, completed)

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "title": "Tech Conference 2024",
      "description": "Annual technology conference",
      "date": "2024-12-15",
      "time": "09:00",
      "location": "Convention Center",
      "capacity": 500,
      "registeredAttendees": 156,
      "price": 99.99,
      "category": "Technology",
      "status": "active"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 10,
    "total": 25,
    "pages": 3
  }
}
```

### Get Event by ID
```http
GET /api/events/:id
```

### Create New Event
```http
POST /api/events
```

**Request Body:**
```json
{
  "title": "New Event",
  "description": "Event description",
  "date": "2024-12-20",
  "time": "14:00",
  "location": "Event Venue",
  "capacity": 100,
  "price": 50.00,
  "category": "Workshop"
}
```

### Update Event
```http
PUT /api/events/:id
```

### Delete Event
```http
DELETE /api/events/:id
```

## Registration API

### Register for Event
```http
POST /api/events/:id/register
```

**Request Body:**
```json
{
  "specialRequirements": "Vegetarian meal required"
}
```

### Get Event Registrations
```http
GET /api/events/:id/registrations
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "userId": 123,
      "eventId": 456,
      "status": "confirmed",
      "paymentStatus": "paid",
      "registeredAt": "2024-01-15T10:30:00Z",
      "user": {
        "firstName": "John",
        "lastName": "Doe",
        "email": "john@example.com"
      }
    }
  ]
}
```

### Cancel Registration
```http
DELETE /api/registrations/:id
```

## Users API

### Get User Profile
```http
GET /api/auth/profile
```

### Update User Profile
```http
PUT /api/users/:id
```

**Request Body:**
```json
{
  "firstName": "Updated Name",
  "lastName": "Updated Last Name",
  "phone": "+1234567890"
}
```

## Authentication API

### User Registration
```http
POST /api/auth/register
```

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "securepassword",
  "firstName": "John",
  "lastName": "Doe",
  "phone": "+1234567890"
}
```

### User Login
```http
POST /api/auth/login
```

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "securepassword"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "user": {
      "id": 1,
      "email": "user@example.com",
      "firstName": "John",
      "lastName": "Doe",
      "role": "attendee"
    }
  }
}
```

### Logout
```http
POST /api/auth/logout
```

## Error Responses

All error responses follow this format:
```json
{
  "success": false,
  "error": {
    "message": "Error description",
    "code": "ERROR_CODE",
    "details": {}
  }
}
```

**Common Error Codes:**
- `VALIDATION_ERROR`: Invalid input data
- `UNAUTHORIZED`: Authentication required
- `FORBIDDEN`: Insufficient permissions
- `NOT_FOUND`: Resource not found
- `CONFLICT`: Resource already exists
- `INTERNAL_ERROR`: Server error

## Rate Limiting
- 100 requests per minute for authenticated users
- 20 requests per minute for unauthenticated users

## Pagination
Most list endpoints support pagination:
- `page`: Page number (default: 1)
- `limit`: Items per page (default: 10, max: 100)

## Filtering and Sorting
Many endpoints support filtering and sorting:
- `sort`: Field to sort by (e.g., `date`, `title`)
- `order`: Sort order (`asc` or `desc`)
- Various field-specific filters (see individual endpoints)