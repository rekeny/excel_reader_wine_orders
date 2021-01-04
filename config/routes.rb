Rails.application.routes.draw do
  root to: 'pages#home'
  resources :items_imports, only: [:create]
  resources :customers, only: [:show]
  patch 'ready', to: 'customers#ready'
  patch 'courier', to: 'customers#courier'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
