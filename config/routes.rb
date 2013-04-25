VotingApp::Application.routes.draw do
  root to: 'static_pages#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :tutorials, only: [:new, :create, :show]

  match '/signup', to: 'users#new', via: :get
  match '/login', to: 'sessions#new', via: :get
  match '/logout', to: 'sessions#destroy', via: :delete
  match '/tutorials/:id/vote', to: 'tutorials#vote', via: :post, as: :vote
end
