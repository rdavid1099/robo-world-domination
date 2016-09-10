Rails.application.routes.draw do
  root 'users#welcome'

  resources :users, only: [:new, :create]

  get '/profile', to: 'users#show'
  delete '/profile', to: 'users#destroy'
  get '/profile/edit', to: 'users#edit'
  patch '/profile', to: 'users#update'

  resources :platoons do
    resources :robots
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
