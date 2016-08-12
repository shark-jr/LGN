class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy, :going, :toggle_host]
  before_filter :only_host, only: [:edit, :update, :destroy, :toggle_host]
  before_action :set_user, only: [:toggle_host]


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
    if @event.events_users.where(is_host: true) == []
        @event.delete
      redirect_to events_path
    else
      redirect_to @event
    end
  end

  def index
    # @events = Event.all
    @events = Event.near([current_user.latitude, current_user.longitude], 300) || Event.near(current_user.city, 300)
  end

  def show
  end

  def delete
    @event.destroy
    Events_user.where(event_id: @event.id).destroy_all
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def toggle_host
  new_host = @event.events_users.find_by(user_id: (@user.id))
  if new_host
    if new_host.is_host
      new_host.is_host = false
    else
      new_host.is_host = true
    end
    new_host.save
    if @event.events_users.where(is_host: true) == []
        @event.delete
      redirect_to events_path
    else
      redirect_to @event
    end
  else
    redirect_to @event
    flash[:notice] = "#{@user.username} isn't attending this event"
  end
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
      redirect_to @event
      flash[:alert] = "You must be a host to do that"

    end
  end
  def set_event
    @event = Event.find(params[:id])
  end
  def set_user
    @user = User.find_by(username: params[:username])
  end
end
