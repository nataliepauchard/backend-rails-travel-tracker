class VisitsController < ApplicationController
  # before_action :check_for_login
  def index
  end

  def show
    visits = User.find_by(:name => 'Jye H').visits.all
    render :json => visits, :include => [:country]
  end

  def create
    country = Country.find_or_create_by :country_code => params[:countryCode], :name => params[:countryName]
    visit = Visit.find_or_create_by :user_id => @current_user.id, :country_id => country.id
    visit.has_visited = params[:has_visited]
    visit.on_bucket_list = params[:on_bucket_list]
    visit.save
    render :json => visit
  end

  def destroy
    country = Country.find_by :country_code => params[:country_code]
    visit = @current_user.visits.find_by :country_id => country.id
    visit.destroy
  end
end
