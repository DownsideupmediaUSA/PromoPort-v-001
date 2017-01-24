Rails.application.routes.draw do

  devise_for :users

  get 'api/comments', to: 'comments#api_index'
  get 'api/songs', to: 'songs#api_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:update]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  root "users#show"
 # nested resource for an artists' songs
  resources :artists do
    resources :songs
  end

  resources :songs  do
    resources :releases
  end

  resources :releases


# for dj dashboard song index





  # get 'artists/:id/songs', to: 'artists#songs_index'
  # get 'users/:id/comments', to: 'users#comments_index'

  resources :dashboard
  resources :users

# nested resource for a songs comments
  resources :songs, only: [:index, :show] do
    resources :comments
  end

  resources :comments, only: [:new, :create, :edit, :update]

# nested resource for a users comments
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
