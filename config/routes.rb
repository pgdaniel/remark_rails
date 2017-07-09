Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :slides
  resource :refresh, controller: 'refresh'
end
