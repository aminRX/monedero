Rails.application.routes.draw do
  get '/sign_in', to: 'sessions#new'

  get '/sign_out', to: 'sessions#destroy'

  post '/clients/search', to: 'clients#search'

  root :to => "static_pages#home"

  resources :sessions, only: [ :create ]

  resources :clients, only: [ :show, :new, :create, :index, :edit, :update] do
    resources :balances, only: [ :new, :create ]
  end
end
