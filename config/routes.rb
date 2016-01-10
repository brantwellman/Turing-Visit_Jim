Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit] do
    resources :gymvisits, only: [:new, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index, :show]
    resources :gymvisits, only: [:edit, :update, :destroy]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
