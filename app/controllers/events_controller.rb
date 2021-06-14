# rubocop:disable all

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index    
    @past_events = Event.previous_events
    @upcoming_events = Event.upcoming_events

    @event_attendee = EventAttendee.new
  end

  def new
    @event = current_user.created_events.build
    #@event = Event.new
    @event_attendee = EventAttendee.new
  end

  def edit
    @event = Event.find(params[:id])
  end
  
  def show
    @users = User.all

    @event_attendees = EventAttendee.all
    @event_attendee = EventAttendee.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    #@event = Event.new(event_params)
    @creator = @event.build_creator(id: current_user.id, email: current_user.email)

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

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
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
