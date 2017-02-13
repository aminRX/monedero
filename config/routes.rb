Rails.application.routes.draw do
  get '/sign_in', to: 'sessions#new'

  get '/sign_out', to: 'sessions#destroy'

  post '/clients/search', to: 'clients#search'

  root :to => "static_pages#home"

  resources :vendors, except: :show

  resources :sessions, only: [ :create ]
  resources :users, only: [ :show, :new, :create, :index ]
  resources :percent_catalogs, only: [ :show, :new, :create ]

  resources :clients, only: [ :show, :new, :create, :index, :edit, :update] do
    get '/balances/use_new', to: 'balances#use_new'
    post '/balances/use_create', to: 'balances#use_create'
    resources :balances, only: [ :new, :create ] do
        resources :balance_informations
    end
  end
end
