Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit] do
    resources :gymvisits, only: [:new, :create]
  end

  namespace :admin do
    resources :users, only: [:index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'


end
