class EventsController < ApplicationController
  #esto viene de devise, asi el user puede ver la lista de eventos, pero si quiere crear, editar, etc... tiene que estar logueado
  before_filter :authenticate_user!, only: [:new,:create, :edit, :update]

  def index
    @events = Event.start_today
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(create_params)
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    @event.save
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def create_params
    params.require(:event).permit(:name, :description, :start_at, :end_at, :address)
  end

end
