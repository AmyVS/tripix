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
      redirect_to trip_picture_path(@user, @picture)
    else
      flash[:alert] = "Something went wrong. Please try again."
      render "new"
    end
  end

private
  def picture_params
    params.require(:picture).permit(:trip_id, :image).merge(:user_id => current_user.id)
  end
end
