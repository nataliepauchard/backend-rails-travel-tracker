Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ['http://localhost:3001', 'https://daniiblack.github.io'] #needs to be replaced with an explicit list of real URLs on Heroku # ##
    resource '*',
      :headers => :any,
      :methods => %i( get post put patch delete options head ),
      :credentials => true
  end
end