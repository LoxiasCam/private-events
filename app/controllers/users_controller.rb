class UsersController < ApplicationController
  def index
    @events = Event.all
  end
  
  def show
    @events = Event.all
    @users = User.all
    @events_attendees = EventAttendee.all
  end
end
