class UsersController < ApplicationController
  before_action :check_for_admin, :only => [:index]

  def index
    @user = User.all
  end

  def new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      render json:@user
    else
      render :json: {
        status: 404
      }
    end
  end

  def get 
    if session[:user_id]
      user = User.find(session[:user_id])
      render json: user
    else
      render json: {
        status: 401
      }
    end
  end

  def destroysession[:user_id] = nil
    render json: {
      status: 401
    }
  end
end
