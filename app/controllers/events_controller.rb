class EventsController < ApplicationController
  #esto viene de devise, asi el user puede ver la lista de eventos, pero si quiere crear, editar, etc... tiene que estar logueado
  before_filter :authenticate_user!, only: [:new,:create, :edit, :update]

  def index
    @events = Event.start_today
    respond_to do |format|
      format.json   #{render json: @events}
      format.html
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.create(create_params)
    @event.user = current_user  #current_user es un helper de device
    authorize @event

    if @event.save
      redirect_to event_path(@event.id)
    # es lo mismo que :  redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
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

  def search
    @events_filtered = Event.events_filtered(params[:term])
    #tambien funciona sin el respond
    respond_to do |format|
      format.json
    end
  end

  private

  def create_params
    params.require(:event).permit(:name, :description, :start_at, :end_at, :address)
  end

end
