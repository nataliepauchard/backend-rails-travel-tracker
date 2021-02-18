class PagesController < ApplicationController
  def home
    @country = %w( Italy Greece Spain ).sample
    @time = Time.now
    @uptime = `uptime` #doesn't work on heroku
  end
end
