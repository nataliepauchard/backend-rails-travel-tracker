class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user
    else
      flash[:error] = "Invalid username or password"
      render json: {}, status: 401 ###
    end
  end

  def get 
    if session[:user_id]
      user = User.find(session[:user_id])
      render json: user
    else
      render json: {}, status: 401 ###
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { ###
      success: true
    }
  end
end
