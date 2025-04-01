Rails.application.routes.draw do
  root 'home#index'
  get 'home/profile'
  get 'home/create'

  get "up" => "rails/health#show", as: :rails_health_check

end
