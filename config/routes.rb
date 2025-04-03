Rails.application.routes.draw do
  root 'home#index'
  get 'home/profile'
  get 'home/create'

  # User authentication
  get "login", to: "authentication#login"
  post "login", to: "authentication#signin"

  get "register", to: "authentication#register"
  post "register", to: "authentication#create"

  get "password/reset", to: "authentication#forgot"
  post "password/reset", to: "authentication#reset"
  get "password/reset/edit", to: "authentication#password"
  patch "password/reset/edit", to: "authentication#change"

  get "edit-user", to: "authentication#edit", as: :edit_user
  patch "edit-user", to: "authentication#update", as: :update_user

  delete "logout", to: "authentication#logout"

  get "up" => "rails/health#show", as: :rails_health_check

end
