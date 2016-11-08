class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])

  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
		@event.update(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      render edit_event_path
    end
  end

  def new
  @event = Event.new
  end

  def create
  @event = Event.new(event_params)
  if @event.save
    redirect_to event_path(@event)
  else
    render new_event_path
  end
end


  def destroy
    Event.delete(params[:id])
  redirect_to url_for(:controller => :events, :action => :index)
  end

  private
  def event_params
    params.require(:event).permit(:title,:description, :start_at, :location, :user_id)
  end
end
