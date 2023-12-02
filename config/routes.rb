Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :games, only: [:new, :create, :edit, :update, :show] do
    resources :rounds, only: [:new, :create]
    resources :game_users, only: [:create]
    resources :questions, only:[:show, :index] do
      resources :proposals, only: [:new, :create]
      resources :votes, only: [:new, :create]
    end
  end
    resources :avatars, only: [:new, :create]
    resources :game_users, only: [:destroy]
    resources :proposals, only: [:index] do
      resources :votes, only: [:new, :create]
    end
  # Defines the root path route ("/")
  # root "posts#index"
end
  # Defines the root path route ("/")
