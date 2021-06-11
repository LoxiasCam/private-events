# rubocop:disable all

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @events = Event.all
    
    @past_events = Event.previous_events
    @upcoming_events = Event.upcoming_events

    @event_attendees = EventAttendee.all
    @event_attendee = EventAttendee.new
  end

  def new
    @event = Event.new
    @event_attendee = EventAttendee.new
    
  end

  def show
    @users = User.all
    @event_attendees = EventAttendee.all
    @event_attendee = EventAttendee.new
  end

  def create
    @event = Event.new(event_params)
    #@event = current_user.events.build(event_params)
    @creator = @event.build_creator(id: current_user.id, email: current_user.email)
    # @creator = @event.build_creator(event_params)

    if @event.save
      redirect_to user_path(current_user), notice: 'Your event was created'
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to user_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
#  def Event.upcoming_events
#    order(:event_date).where('event_date >= ?', Time.zone.now)
#  end

#  def Event.previous_events
#    order(:event_date).where('event_date < ?',  Time.zone.now)
#  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:event_name, :event_date, :user_id)
  end
end
