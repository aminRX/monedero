Rails.application.routes.draw do
  get '/sign_in', to: 'sessions#new'

  get '/sign_out', to: 'sessions#destroy'

  root :to => "static_pages#home"

  resources :sessions, only: [ :create ]

  resources :clients, only: [ :show, :new, :create, :index ]
end
