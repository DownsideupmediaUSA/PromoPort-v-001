Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  root "users#show"

  resources :artists do
    resources :songs 
  end

  get 'artists/:id/songs', to: 'artists#songs_index'
  get 'artists/:id/songs/:song_id', to: 'artists#song'

  resources :dashboard
  resources :users
  resources :songs do
    resources :comments
  end
  resources :users, only: [:index,:show, :new, :create, :edit, :update] do
    resources :comments , only: [:index,:show ]
  end



  resources :genres, only: [:index,:show, :new, :create, :edit, :update] do
    resources :songs, only: [:show, :index]
  end



  match 'auth/:facebook/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  # match 'users/sign_out' => "devise/sessions#destroy", via: [:get, :post]


end
