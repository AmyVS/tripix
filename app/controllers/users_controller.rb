class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.user_id
      redirect_to root_url, notice: "Thanks for signing up!"
    else
      render "new"
    end
  end
end
