class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
    @event = Event.new
  end
 
  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    
    if @event.save
      redirect_to root_path, notice: "Your event was created"
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:event_name, :event_date)
  end
end
