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
      render json: {
        status: 401
      }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
