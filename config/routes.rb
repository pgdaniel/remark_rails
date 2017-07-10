Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :slides
  resource :refresh, controller: 'refresh'

  root to: 'slides#index'
end
