VotingApp::Application.routes.draw do
  root to: 'static_pages#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :tutorials, only: [:new, :create, :show]

  match '/signup', to: 'users#new'
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: :delete
end
