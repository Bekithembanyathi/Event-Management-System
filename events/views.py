from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.core.paginator import Paginator
from django.db import IntegrityError
from .models import Event, Registration
from .forms import EventForm


def event_list(request):
    events = Event.objects.all()
    paginator = Paginator(events, 6)  # Show 6 events per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'events/event_list.html', {'page_obj': page_obj})


def event_detail(request, pk):
    event = get_object_or_404(Event, pk=pk)
    is_registered = False
    if request.user.is_authenticated:
        is_registered = Registration.objects.filter(event=event, user=request.user).exists()
    
    context = {
        'event': event,
        'is_registered': is_registered,
    }
    return render(request, 'events/event_detail.html', context)


@login_required
def create_event(request):
    if request.method == 'POST':
        form = EventForm(request.POST, request.FILES)
        if form.is_valid():
            event = form.save(commit=False)
            event.organizer = request.user
            event.save()
            messages.success(request, 'Event created successfully!')
            return redirect('event_detail', pk=event.pk)
    else:
        form = EventForm()
    return render(request, 'events/create_event.html', {'form': form})


@login_required
def register_for_event(request, pk):
    event = get_object_or_404(Event, pk=pk)
    
    if event.is_full:
        messages.error(request, 'This event is already full!')
        return redirect('event_detail', pk=pk)
    
    try:
        Registration.objects.create(event=event, user=request.user)
        messages.success(request, 'You have successfully registered for this event!')
    except IntegrityError:
        messages.error(request, 'You are already registered for this event!')
    
    return redirect('event_detail', pk=pk)


@login_required
def unregister_from_event(request, pk):
    event = get_object_or_404(Event, pk=pk)
    registration = get_object_or_404(Registration, event=event, user=request.user)
    registration.delete()
    messages.success(request, 'You have successfully unregistered from this event!')
    return redirect('event_detail', pk=pk)


@login_required
def my_events(request):
    organized_events = Event.objects.filter(organizer=request.user)
    registered_events = Event.objects.filter(registrations__user=request.user)
    
    context = {
        'organized_events': organized_events,
        'registered_events': registered_events,
    }
    return render(request, 'events/my_events.html', context)
