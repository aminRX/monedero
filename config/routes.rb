Rails.application.routes.draw do
  get '/sign_in', to: 'sessions#new'

  get '/sign_out', to: 'sessions#destroy'

  get '/', to: 'static_pages#home'

  resources :sessions, only: [ :create ]
end
