class DashboardController < ApplicationController
  def country
    country = %w( Italy Greece Spain ).sample
    render :country
  end
end
