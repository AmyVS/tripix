class TripsController < ApplicationController
  before_filter :authorize

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)
    if @trip.valid?
      flash[:notice] = "Your trip has been documented!"
      redirect_to trip_path(@trip)
    else
      flash[:alert] = "Something went wrong. Please try again."
      render "new"
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      flash[:notice] = "Your trip has been edited."
      redirect_to trip_path(@trip)
    else
      flash[:alert] = "Something went wrong. Please try again."
      render "edit"
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:notice] = "Your trip has been removed."
    redirect_to user_path
  end

private
  def trip_params
    params.require(:trip).permit(:name).merge(:user_id => current_user.id)
  end
end
