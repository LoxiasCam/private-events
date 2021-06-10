# frozen_string_literal: true
# rubocop:disable all

class EventAttendeesController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @event = Event.new
    @event_attendees = EventAttendee.all
    @event_attendee = EventAttendee.new
  end

  def new
    @event_attendee = EventAttendee.new
    @event = Event.new
  end

  def create
    @event_attendee = EventAttendee.new(event_attendee_params)

    if @event_attendee.save
      redirect_to root_path, notice: 'You are attending this event!'
    else
      render :new
    end
  end

  def event_attendee_params
    params.require(:event_attendee).permit(:attended_event_id, :event_attendee_id)
  end
end

# rubocop:enable all