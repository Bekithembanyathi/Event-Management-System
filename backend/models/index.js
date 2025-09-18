// Sample Event Model
// Replace with your ORM/Database library of choice (Sequelize, Prisma, Mongoose, etc.)

class Event {
    constructor(data) {
        this.id = data.id;
        this.title = data.title;
        this.description = data.description;
        this.date = data.date;
        this.time = data.time;
        this.location = data.location;
        this.capacity = data.capacity;
        this.price = data.price;
        this.category = data.category;
        this.organizerId = data.organizerId;
        this.status = data.status || 'active';
        this.createdAt = data.createdAt || new Date();
        this.updatedAt = data.updatedAt || new Date();
    }

    // Sample validation method
    validate() {
        const errors = [];
        
        if (!this.title || this.title.trim().length === 0) {
            errors.push('Title is required');
        }
        
        if (!this.date) {
            errors.push('Date is required');
        }
        
        if (!this.location || this.location.trim().length === 0) {
            errors.push('Location is required');
        }
        
        if (this.capacity && this.capacity < 1) {
            errors.push('Capacity must be at least 1');
        }
        
        if (this.price && this.price < 0) {
            errors.push('Price cannot be negative');
        }
        
        return {
            isValid: errors.length === 0,
            errors: errors
        };
    }

    // Sample method to format event for API response
    toJSON() {
        return {
            id: this.id,
            title: this.title,
            description: this.description,
            date: this.date,
            time: this.time,
            location: this.location,
            capacity: this.capacity,
            price: this.price,
            category: this.category,
            organizerId: this.organizerId,
            status: this.status,
            createdAt: this.createdAt,
            updatedAt: this.updatedAt
        };
    }
}

// Sample User model
class User {
    constructor(data) {
        this.id = data.id;
        this.email = data.email;
        this.firstName = data.firstName;
        this.lastName = data.lastName;
        this.phone = data.phone;
        this.role = data.role || 'attendee'; // attendee, organizer, admin
        this.isActive = data.isActive !== false;
        this.createdAt = data.createdAt || new Date();
        this.updatedAt = data.updatedAt || new Date();
    }

    validate() {
        const errors = [];
        
        if (!this.email || !this.email.includes('@')) {
            errors.push('Valid email is required');
        }
        
        if (!this.firstName || this.firstName.trim().length === 0) {
            errors.push('First name is required');
        }
        
        if (!this.lastName || this.lastName.trim().length === 0) {
            errors.push('Last name is required');
        }
        
        return {
            isValid: errors.length === 0,
            errors: errors
        };
    }

    getFullName() {
        return `${this.firstName} ${this.lastName}`;
    }

    toJSON() {
        return {
            id: this.id,
            email: this.email,
            firstName: this.firstName,
            lastName: this.lastName,
            phone: this.phone,
            role: this.role,
            isActive: this.isActive,
            fullName: this.getFullName(),
            createdAt: this.createdAt,
            updatedAt: this.updatedAt
        };
    }
}

// Sample Registration model
class Registration {
    constructor(data) {
        this.id = data.id;
        this.eventId = data.eventId;
        this.userId = data.userId;
        this.status = data.status || 'confirmed'; // pending, confirmed, cancelled
        this.registeredAt = data.registeredAt || new Date();
        this.paymentStatus = data.paymentStatus || 'pending'; // pending, paid, refunded
    }

    validate() {
        const errors = [];
        
        if (!this.eventId) {
            errors.push('Event ID is required');
        }
        
        if (!this.userId) {
            errors.push('User ID is required');
        }
        
        return {
            isValid: errors.length === 0,
            errors: errors
        };
    }

    toJSON() {
        return {
            id: this.id,
            eventId: this.eventId,
            userId: this.userId,
            status: this.status,
            registeredAt: this.registeredAt,
            paymentStatus: this.paymentStatus
        };
    }
}

module.exports = {
    Event,
    User,
    Registration
};