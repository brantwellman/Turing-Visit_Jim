Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit]

  namespace :admin do
    resources :users, only: [:index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'


end
