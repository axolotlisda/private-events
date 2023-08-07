Rails.application.routes.draw do
  get 'invitations/index'
  devise_for :users do
    delete 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root "events#index"
  # get '/events', to: 'events#index'

  # get 'users', to: 'users#index'

  # patch '/events/:id', to: 'events#update'

  resources :users do
    member do
      delete 'destroy_event', to: 'users#delete_event'
    end
  end

  
  resources :events, only: [:index, :new, :create, :show, :edit, :update] do
    member do
      post 'attend', to: 'attendings#create'
      delete 'attend', to: 'attendings#delete'
      post 'invite', to: 'invites#create'
    end
  end

  resources :invitations, only: [:index] do
    post :accept, on: :member
    post :decline, on: :member
  end


  

  # resources :invites, only: :create

  #attending.attended_events
  get '/users/:id', to: 'users#show', as: 'show_user'
end