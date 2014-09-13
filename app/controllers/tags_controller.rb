class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    if @tag.valid?
      flash[:notice] = "Your tags have been saved."
      redirect_to trip_path(@trip)
    else
      flash[:alert] = "Something went wrong. Please try again."
      render "new"
    end
  end

private
  def tag_params
    params.require(:tag).permit().merge(:user_id => current_user.id, :picture_id => @picture.id, :trip_id => @trip.id)
  end
end
