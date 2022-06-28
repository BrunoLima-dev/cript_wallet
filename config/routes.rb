Rails.application.routes.draw do
  resources :mining_types
  get 'wwelcome/index'
  #get '/inicio', to: 'wwelcome#index'

  resources :coins

  root to: 'wwelcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
