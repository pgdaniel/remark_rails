Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :remark, controller: 'remark'
  resource :refresh, controller: 'refresh'
end
