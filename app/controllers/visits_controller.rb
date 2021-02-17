class VisitsController < ApplicationController
  before_action :check_for_login
  def index
  end

  def create
    country = Country.find_or_create_by :country_code => params[:countryCode], :name => params[:countryName]
    visit = Visit.create #visit_params to do bucketlist
    @current_user.visits << visit
    country.visits << visit
    render :json => visit
  end

  def check_for_login
   redirect_to login_path unless @current_user.present?
  end

  # private
  # def visit_params
  #   params.require(:visit).permit(:enter all the things )
  # end

end
