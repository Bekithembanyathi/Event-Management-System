from django.urls import path
from . import views

urlpatterns = [
    path('', views.event_list, name='event_list'),
    path('event/<int:pk>/', views.event_detail, name='event_detail'),
    path('create/', views.create_event, name='create_event'),
    path('event/<int:pk>/register/', views.register_for_event, name='register_for_event'),
    path('event/<int:pk>/unregister/', views.unregister_from_event, name='unregister_from_event'),
    path('my-events/', views.my_events, name='my_events'),
]