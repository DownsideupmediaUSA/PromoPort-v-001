Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  root "users#show"

  resources :artists do
    resources :songs, only: [:index, :show]
  end

  # get 'artists/:id/songs', to: 'artists#songs_index'
  # get 'users/:id/comments', to: 'users#comments_index'

  resources :dashboard
  resources :users
  resources :songs, only: [:index, :show] do
    resources :comments
  end
  resources :users, only: [:index,:show, :new, :create, :edit, :update] do
    resources :comments , only: [:index,:show ]
  end
  resources :songs do
    resources  :artists
  end

  resources :genres, only: [:index,:show, :new, :create, :edit, :update] do
    resources :songs, only: [:show, :index]
  end



  match 'auth/:facebook/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  # match 'users/sign_out' => "devise/sessions#destroy", via: [:get, :post]


end
