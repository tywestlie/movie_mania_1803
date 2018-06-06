Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :show, :index, :create]
  resources :movies, only: [:index]

  resources :directors, shallow: true do
    resources :movies, param: :slug
  end

  resources :actors, only: [:new, :create, :index]

  namespace :admin do
    resources :categories, only: [:index]
    resources :genres, only: [:new, :create, :index, :show]
  end

  resources :genres, only: [:index, :show]

  resources :carts, only: [:create]
end
