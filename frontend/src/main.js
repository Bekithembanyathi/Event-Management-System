// Event Management System - Main JavaScript
console.log('Event Management System loaded');

// Sample event data structure
const sampleEvent = {
    id: 1,
    title: "Tech Conference 2024",
    description: "Annual technology conference featuring latest innovations",
    date: "2024-12-15",
    time: "09:00",
    location: "Convention Center",
    capacity: 500,
    registeredAttendees: 0,
    price: 99.99,
    category: "Technology",
    organizer: "Tech Corp",
    status: "active"
};

// Sample functions for event management
class EventManager {
    constructor() {
        this.events = [];
        this.attendees = [];
    }

    // Create a new event
    createEvent(eventData) {
        const newEvent = {
            id: Date.now(),
            ...eventData,
            createdAt: new Date(),
            registeredAttendees: 0,
            status: 'active'
        };
        this.events.push(newEvent);
        return newEvent;
    }

    // Get all events
    getAllEvents() {
        return this.events;
    }

    // Get event by ID
    getEventById(id) {
        return this.events.find(event => event.id === id);
    }

    // Register attendee for event
    registerAttendee(eventId, attendeeData) {
        const event = this.getEventById(eventId);
        if (!event) {
            throw new Error('Event not found');
        }
        
        if (event.registeredAttendees >= event.capacity) {
            throw new Error('Event is full');
        }

        const attendee = {
            id: Date.now(),
            eventId: eventId,
            ...attendeeData,
            registeredAt: new Date()
        };

        this.attendees.push(attendee);
        event.registeredAttendees++;
        
        return attendee;
    }

    // Cancel event registration
    cancelRegistration(attendeeId) {
        const attendeeIndex = this.attendees.findIndex(a => a.id === attendeeId);
        if (attendeeIndex === -1) {
            throw new Error('Registration not found');
        }

        const attendee = this.attendees[attendeeIndex];
        const event = this.getEventById(attendee.eventId);
        
        if (event) {
            event.registeredAttendees--;
        }

        this.attendees.splice(attendeeIndex, 1);
        return true;
    }

    // Get attendees for an event
    getEventAttendees(eventId) {
        return this.attendees.filter(attendee => attendee.eventId === eventId);
    }
}

// Initialize event manager
const eventManager = new EventManager();

// Example usage
try {
    // Create a sample event
    const newEvent = eventManager.createEvent({
        title: "Sample Event",
        description: "This is a sample event for demonstration",
        date: "2024-12-20",
        time: "14:00",
        location: "Sample Venue",
        capacity: 100,
        price: 50.00,
        category: "Workshop"
    });
    
    console.log('Sample event created:', newEvent);

    // Register a sample attendee
    const attendee = eventManager.registerAttendee(newEvent.id, {
        name: "John Doe",
        email: "john@example.com",
        phone: "+1234567890"
    });
    
    console.log('Sample attendee registered:', attendee);
    
} catch (error) {
    console.error('Error:', error.message);
}

// DOM manipulation functions (for frontend integration)
function displayEvents(events) {
    // This function would render events in the UI
    console.log('Displaying events:', events);
}

function showEventDetails(eventId) {
    const event = eventManager.getEventById(eventId);
    console.log('Event details:', event);
}

// Export for use in other modules (if using module system)
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { EventManager, eventManager };
}