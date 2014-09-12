class TripsController < ApplicationController
  def index
    @trips = Trips.all
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

private
  def trip_params
    params.require(:trip).permit(:name).merge(:user_id => current_user.id)
  end
end
