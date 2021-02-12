Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :index]

  get '/login' => 'session#new' # deals with one session at a time - unsure if React does this instead?
  post '/login' => 'session#create' # does the log in - unsure if React does this instead?
  delete '/login' => 'session#destroy' #log out - unsure if React does this instead?
end
