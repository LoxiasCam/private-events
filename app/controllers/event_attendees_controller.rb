class EventAttendeesController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  def new
    @event_attendee = EventAttendee.new
  end

  def create
    @event_attendee = EventAttendee.new(event_attendee_params)
    if @event_attendee.save
      redirect_to root_path
    else
      render :new
    end
  end

  def event_attendee_params
    params.require(:event_attendee).permit(:attended_event_id, :event_attendee_id)
  end
end
