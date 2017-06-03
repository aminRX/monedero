Rails.application.routes.draw do
  get 'use_points/new'

  get 'use_points/create'

  get 'use_points/edit'

  get 'use_points/update'

  get '/sign_in', to: 'sessions#new'

  get '/sign_out', to: 'sessions#destroy'

  post '/clients/search', to: 'clients#search'

  root :to => "static_pages#home"

  resources :vendors, except: :show
  resources :cards
  resources :sessions, only: [ :create ]
  resources :users, only: [ :show, :new, :create, :index ]
  resources :use_points, only: [ :new, :create, :edit, :update, :show ]

  resources :clients, only: [ :show, :new, :create, :index, :edit, :update] do
    get '/balances/use_new', to: 'balances#use_new'
    post '/balances/use_create', to: 'balances#use_create'
    resources :balances, only: [ :new, :create, :destroy ] do
        resources :balance_informations
    end
  end
end
