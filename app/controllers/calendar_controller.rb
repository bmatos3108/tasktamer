class CalendarController < ApplicationController
  before_action :authenticate_user!
  before_action :set_events

  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to calendar_path, notice: 'Event created successfully.'
    else
      render :new
    end
  end

  private

  def set_events
    @events = current_user.events
  end

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date, :description, :location)
  end
end
