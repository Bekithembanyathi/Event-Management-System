-- Event Management System Database Schema
-- This is a sample PostgreSQL schema. Adapt for your database of choice.

-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(20) DEFAULT 'attendee' CHECK (role IN ('attendee', 'organizer', 'admin')),
    is_active BOOLEAN DEFAULT true,
    email_verified BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Events table
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    event_date DATE NOT NULL,
    start_time TIME,
    end_time TIME,
    location VARCHAR(255) NOT NULL,
    venue_details TEXT,
    capacity INTEGER,
    price DECIMAL(10, 2) DEFAULT 0.00,
    category VARCHAR(100),
    organizer_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('draft', 'active', 'cancelled', 'completed')),
    image_url VARCHAR(500),
    is_featured BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Event registrations table
CREATE TABLE registrations (
    id SERIAL PRIMARY KEY,
    event_id INTEGER REFERENCES events(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    status VARCHAR(20) DEFAULT 'confirmed' CHECK (status IN ('pending', 'confirmed', 'cancelled')),
    payment_status VARCHAR(20) DEFAULT 'pending' CHECK (payment_status IN ('pending', 'paid', 'refunded')),
    payment_amount DECIMAL(10, 2),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    special_requirements TEXT,
    UNIQUE(event_id, user_id)
);

-- Event categories table (optional)
CREATE TABLE event_categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    color_code VARCHAR(7), -- For UI theming
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Event tags table (many-to-many relationship)
CREATE TABLE event_tags (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Junction table for events and tags
CREATE TABLE event_tag_associations (
    event_id INTEGER REFERENCES events(id) ON DELETE CASCADE,
    tag_id INTEGER REFERENCES event_tags(id) ON DELETE CASCADE,
    PRIMARY KEY (event_id, tag_id)
);

-- Event comments/feedback table
CREATE TABLE event_feedback (
    id SERIAL PRIMARY KEY,
    event_id INTEGER REFERENCES events(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    is_public BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Notifications table
CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    event_id INTEGER REFERENCES events(id) ON DELETE CASCADE,
    type VARCHAR(50) NOT NULL, -- 'event_reminder', 'registration_confirmation', etc.
    title VARCHAR(255) NOT NULL,
    message TEXT,
    is_read BOOLEAN DEFAULT false,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for better performance
CREATE INDEX idx_events_date ON events(event_date);
CREATE INDEX idx_events_organizer ON events(organizer_id);
CREATE INDEX idx_events_status ON events(status);
CREATE INDEX idx_registrations_event ON registrations(event_id);
CREATE INDEX idx_registrations_user ON registrations(user_id);
CREATE INDEX idx_notifications_user ON notifications(user_id);
CREATE INDEX idx_users_email ON users(email);

-- Sample data
INSERT INTO event_categories (name, description, color_code) VALUES
('Technology', 'Tech conferences, workshops, and meetups', '#3498db'),
('Business', 'Business networking and professional events', '#2ecc71'),
('Education', 'Educational workshops and seminars', '#e74c3c'),
('Entertainment', 'Concerts, shows, and entertainment events', '#9b59b6'),
('Sports', 'Sports events and competitions', '#f39c12');

INSERT INTO event_tags (name) VALUES
('networking'),
('workshop'),
('conference'),
('beginner-friendly'),
('advanced'),
('free'),
('online'),
('in-person'),
('certification'),
('hands-on');