Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"

  resources :pages, only: [:show]
  root to: "pages#index"
  resources :meetings, only: [:new, :create, :show, :update, :destroy]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get 'form_page', to: 'pages#form_page'
  get 'sessions_page', to: 'pages#sessions_page'
end
