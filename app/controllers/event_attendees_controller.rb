class EventAttendeesController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @event_attendees = EventAttendee.all
    @event_attendee = EventAttendee.new
  end
  def new
    @event_attendee = EventAttendee.new
  end

  def create
    #@event_attendee = EventAttendee.new(event_attendee_params)
    @event_attendee = current_user.event_attendees.build(event_attendee_params)
    #@creator = @event_attendee.build(id: current_user.id, email: current_user.email)
    
    if @event_attendee.save
      redirect_to root_path, notice: "Your event was created"
    else
      render :new
    end
  end

  def destroy
    @event_attendee.destroy
    respond_to do |format|
      format.html { redirect_to user_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event_attendee = EventAttendee.find(params[:id])
  end

  def event_attendee_params
    params.require(:event_attendee).permit(:attended_event_id, :event_attendee_id)
  end
end
