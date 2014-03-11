class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(create_params)
    redirect_to events_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def create_params
    params.require(:event).permit(:name, :description, :start_at, :end_at, :address)
  end
end
