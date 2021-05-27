class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Your event was created"
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :event_date)
  end
end
