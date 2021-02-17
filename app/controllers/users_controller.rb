class UsersController < ApplicationController
  before_action :check_for_admin, :only => [:index]

  def index
    @user = User.all
  end

  def new
  end

  def create # ##
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      render json: @user
    else
      render json: {}, status: 404
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
