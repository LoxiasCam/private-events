# rubocop:disable all

class EventAttendeesController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def new
    @event_attendee = EventAttendee.new
    @event = Event.new
  end

  def create
    @event_attendee = EventAttendee.new(event_attendee_params)

    if @event_attendee.save
      redirect_to request.referrer, notice: 'You are attending this event!'
    else
      render :new
    end
  end

  def destroy
    @event_attendee.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'You are not attending this anymore.' }
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

# rubocop:enable all