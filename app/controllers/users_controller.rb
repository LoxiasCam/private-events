# rubocop:disable all

class UsersController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def show
    #@created_events = current_user.events
    @events = Event.all
    
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
