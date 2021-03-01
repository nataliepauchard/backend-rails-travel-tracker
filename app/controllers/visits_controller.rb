class VisitsController < ApplicationController
  # before_action :check_for_login
  def index
  end

  def show
    visits = User.find_by(:name => 'Jye H').visits.all # dodgy work around because of issues with heroku treating @current_user as nil. delete later
    # visits = @current_user.visits.all ###### original code. uncomment later.
    render :json => visits, :include => [:country]
  end

  def create
    country = Country.find_or_create_by :country_code => params[:countryCode], :name => params[:countryName]
    visit = Visit.find_or_create_by :name => 'Jye H', :country_id => country.id # dodgy work around because of issues with heroku treating @current_user as nil. delete later
    # visit = Visit.find_or_create_by :user_id => @current_user.id, :country_id => country.id ###### original code. uncomment later.
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
