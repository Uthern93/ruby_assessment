Rails.application.routes.draw do
  root 'home#index'
  get 'home/profile'
  get 'home/create'

  # User authentication
  get "login", to: "authentication#login"
  post "login", to: "authentication#signin"
  get "register", to: "authentication#register"
  post "register", to: "authentication#create"
  delete "logout", to: "authentication#logout"

  get "up" => "rails/health#show", as: :rails_health_check

end
