class UsersController < ApplicationController
  def index
    @events = Event.all
  end
  
  def show
    @events = Event.all
    @events_attendees = EventAttendee.all
  end
end
