class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy, :going]
  before_filter :only_host, only: [:edit, :update, :destroy]
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
        @event.users << current_user
          if @event.events_users.first.user_id == current_user.id
             @event.events_users.first.update(is_host: true)
          end
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

  end

  def going
    if @event.users.include?(current_user)
      @event.users.delete(current_user)
    else
      @event.users << current_user
    end
    redirect_to @event
  end

  def index
    @events = Event.all
  end

  def show
  end

  def delete
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def update
  #if current_user is host
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

    private
  def event_params
    params.require(:event).permit(:name, :description, :date, :time, :address, :city, :state, :zip, :country)
  end
  def only_host
    unless @event.events_users.where(is_host: true, user_id: current_user.id).exists?
      # TODO: flash access denied message
    end
  end
  def set_event
    @event = Event.find(params[:id])
  end

end
