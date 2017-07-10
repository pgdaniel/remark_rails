Rails.application.routes.draw do
  get 'gallery/index'

  get 'gallery/new'

  get 'gallery/create'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :slides
  resource :refresh, controller: 'refresh'
end
