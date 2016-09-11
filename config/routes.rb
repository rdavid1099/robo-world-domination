Rails.application.routes.draw do
  root 'users#warzone'

  resources :users, only: [:new, :create]

  get '/profile', to: 'users#show'
  delete '/profile', to: 'users#destroy'
  get '/profile/edit', to: 'users#edit'
  patch '/profile', to: 'users#update'

  resources :platoons do
    resources :robots
  end

  get '/wars/challenge/:id', to: 'wars#challenge', as: 'war_challenge'
  post '/war/round', to: 'wars#prep'
  get '/war/round', to: 'wars#round'
  post '/war/attack', to: 'wars#attack'
  get '/war/endgame', to: 'wars#over'

  resources :wars, only: [:index, :show]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
