Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items_imports, only: [:create]
  resources :customers, only: [:show, :edit, :update] do
    resources :reports, only: [:create]
  end
  patch 'dispatched', to: 'customers#dispatched'
  patch 'courier', to: 'customers#courier'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
