# rubocop:disable all

class UsersController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def show
    @created_events = current_user.created_events
    @past_events = current_user.attended_event.previous_events
    @upcoming_events = current_user.attended_event.upcoming_events
    
    @users = User.all
    @events_attendees = EventAttendee.all
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to user_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find_by(params[:user_id])
  end
end
