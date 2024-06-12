Rails.application.routes.draw do
  devise_for :users

  resources :pages, only: [:index, :show]
  patch 'meetings/:id/extend', to: 'meetings#extend'
  resources :meetings, only: [:new, :create, :show, :update, :destroy] do
    member do
      get "/chat", to: "meetings#chat"
      get 'howdiditgo'
      get 'share'
    end
    resources :messages, only: [:create]
    resources :locations, only: [:create, :edit]
  end
  resources :friends
  resources :friend_meetings, only: [:create, :destroy]

  resources :pages, only: [:index, :show] do
    resources :messages, only: [:create]
  end

  resources :friends
  resources :friend_meetings, only: [:create, :destroy]
  resources :users, only: [:create, :update]
  resources :admin, only: [:index, :show]

  get "profiles/edit", to: 'users#edit', as: :edit_profile
  get "profiles/:id", to: 'users#profile', as: :profile

  root to: "pages#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get 'form_page', to: 'pages#form_page'
  get 'sessions_page', to: 'pages#sessions_page'
end
