# Event Management System

A Django-based web application for managing events, user registration, and event organization.

![Event Management System](https://github.com/user-attachments/assets/88b58e04-71f8-4f11-a810-c74ebfbf8baf)

## Features

- **User Authentication**: Registration, login, and logout functionality
- **Event Management**: Create, view, and manage events
- **Event Registration**: Users can register for and unregister from events
- **My Events Dashboard**: View organized events and attended events
- **Admin Interface**: Django admin for managing events and registrations
- **Responsive Design**: Bootstrap-based UI that works on all devices
- **Image Upload**: Support for event images

## Screenshots

### My Events Dashboard
![My Events Dashboard](https://github.com/user-attachments/assets/c578253d-994a-462f-b65b-c45a3e3b8f9c)

## Installation & Setup

### Prerequisites
- Python 3.8+
- pip

### Step 1: Clone the Repository
```bash
git clone https://github.com/Bekithembanyathi/Event-Management-System.git
cd Event-Management-System
```

### Step 2: Install Dependencies
```bash
pip install -r requirements.txt
```

### Step 3: Database Setup
```bash
# Create and apply migrations
python manage.py makemigrations
python manage.py migrate

# Create a superuser (optional)
python manage.py createsuperuser
```

### Step 4: Run the Development Server
```bash
python manage.py runserver
```

The application will be available at `http://localhost:8000`

## Usage

### For Users
1. **Register/Login**: Create an account or login with existing credentials
2. **Browse Events**: View all available events on the homepage
3. **Register for Events**: Click on events to view details and register
4. **Manage Registrations**: View and manage your event registrations
5. **Create Events**: Create new events for others to join

### For Administrators
1. Access the admin interface at `http://localhost:8000/admin/`
2. Login with superuser credentials
3. Manage events, users, and registrations

## Project Structure

```
Event-Management-System/
├── event_management/          # Main project settings
│   ├── __init__.py
│   ├── settings.py           # Django settings
│   ├── urls.py              # Main URL configuration
│   └── wsgi.py
├── events/                   # Events app
│   ├── models.py            # Event and Registration models
│   ├── views.py             # Event-related views
│   ├── forms.py             # Event forms
│   ├── urls.py              # Event URL patterns
│   └── admin.py             # Admin configuration
├── accounts/                 # User authentication app
│   ├── views.py             # Authentication views
│   └── urls.py              # Authentication URL patterns
├── templates/               # HTML templates
│   ├── base.html            # Base template
│   ├── events/              # Event templates
│   └── registration/        # Authentication templates
├── static/                  # Static files (CSS, JS, images)
├── media/                   # User-uploaded files
├── requirements.txt         # Python dependencies
└── manage.py               # Django management script
```

## Models

### Event
- Title, description, date/time
- Location and maximum attendees
- Organizer (User relationship)
- Optional image upload
- Created/updated timestamps

### Registration
- Event and User relationship
- Registration timestamp
- Unique constraint to prevent duplicate registrations

## Features in Detail

### Authentication System
- User registration with Django's built-in forms
- Login/logout functionality
- Protected views requiring authentication

### Event Management
- Create events with detailed information
- View event details with registration status
- Automatic calculation of available spots
- Image upload for event promotion

### Registration System
- One-click event registration
- Duplicate registration prevention
- Registration status tracking
- Unregistration capability

### User Dashboard
- "My Events" page showing:
  - Events organized by the user
  - Events the user is attending
  - Registration counts and status

## Technologies Used

- **Backend**: Django 5.2.6
- **Database**: SQLite (default, configurable)
- **Frontend**: HTML5, CSS3, Bootstrap 5.1.3
- **Icons**: Font Awesome 6.0.0
- **Image Processing**: Pillow

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests (if available)
5. Submit a pull request

## License

This project is open source and available under the [MIT License](LICENSE).

## Future Enhancements

- Email notifications for event updates
- Event categories and filtering
- Event search functionality
- Payment integration for paid events
- Event calendar view
- Social media integration
- Event feedback and rating system
