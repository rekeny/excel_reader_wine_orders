Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dispatched', to: 'pages#dispatched'
  resources :items_imports, only: [:create]
  resources :customers, only: [:show, :edit, :update] do
    resources :reports, only: [:create]
  end
  patch 'dispatched', to: 'customers#dispatched'
  patch 'courier', to: 'customers#courier'
  patch 'delivered', to: 'customers#delivered'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :customers, only: [ :create ]
      resources :orders, only: [ :create ]
    end
  end

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
