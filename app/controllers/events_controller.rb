class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    time = Time.current
    @next_events = Event.pending(time)
    @past_events = Event.expired(time)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_parameters)

    if @event.save
      flash[:notice] = "Event created!"
      redirect_to @event
    else
      flash[:alert] = "An error has ocurred."
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])

    if @event.creator === current_user
      if @event.destroy
        flash[:notice] = "Event deleted!"
        redirect_to "/"
      else
        flash[:alert] = "An error has ocurred."
        redirect_to @event
      end
    end
  end

  private
    def event_parameters
      params.require(:event).permit(
        :name, 
        :description,
        :location,
        :date
      )
    end
end
