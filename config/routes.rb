require 'sidekiq/web'

Rails.application.routes.draw do

  namespace :admin do
    resources :campaigns
    resources :clients
    resources :discounts
    resources :products
    resources :sells
    resources :services
    resources :suppliers
  end
  # mount Fae below your admin namespec
  mount Fae::Engine => '/admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'

  root 'fae/pages#home'
end
