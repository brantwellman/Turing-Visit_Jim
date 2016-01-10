Rails.application.routes.draw do
  root 'sessions#new'

  resources :users, only: [:new, :create, :show] do
    resources :gymvisits, only: [:new, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :gymvisits, only: [:edit, :update, :destroy]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


end
