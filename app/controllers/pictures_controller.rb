class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @picture = Picture.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @picture = Picture.create(picture_params)
    if @picture.valid?
      flash[:notice] = "Your picture has been added!"
      redirect_to trip_path(@trip)
    else
      flash[:alert] = "Something went wrong. Please try again."
      render "new"
    end
  end

private
  def picture_params
    params.require(:picture).permit(:photo).merge(:user_id => current_user.id, :trip_id => @trip.id)
  end
end
