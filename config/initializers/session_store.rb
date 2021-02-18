if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: 'backend-rails-travel-tracker', domain: 'daniiblack.github.io', :secure => true
else
  Rails.application.config.session_store :cookie_store, key: 'backend-rails-travel-tracker'
end
