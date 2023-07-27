Rails.application.routes.draw do
  devise_for :users do
    delete 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root "events#index"
  # get '/events', to: 'events#index'

  # get 'users', to: 'users#index'

  resources :users

  
  resources :events do
    member do
      post 'attend', to: 'attendings#create'
    end
  end

  #attending.attended_events
  get '/users/:id', to: 'users#show', as: 'show_user'
  
end