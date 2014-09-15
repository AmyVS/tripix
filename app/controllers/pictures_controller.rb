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

  def edit
    @trip = Trip.find(params[:trip_id])
    @picture = Picture.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      flash[:notice] = "Your picture has been replaced."
      redirect_to trip_path(@trip)
    else
      flash[:alert] = "Something went wrong. Please try again."
      render "edit"
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:alert] = "Your picture has been removed."
    redirect_to trip_path(@trip)
  end

private
  def picture_params
    params.require(:picture).permit(:photo).merge(:user_id => current_user.id, :trip_id => @trip.id)
  end
end
