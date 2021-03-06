class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thanks for signing up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :id)
  end
end
