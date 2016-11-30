Rails.application.routes.draw do
  devise_for :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  root "users#show"

  resources :artists do
    resources :songs, only: [:show, :index]
  end
  resources :dashboard
  resources :users
  resources :songs, only: [:index,:show, :new, :create, :edit, :update] do
    resources :comments , only: [:index,:show, :new, :create, :edit, :update]
  end
  resources :songs
  resources :comments
  resources :genres, only: [:index,:show, :new, :create, :edit, :update] do
    resources :songs, only: [:show, :index]
  end



  match 'auth/:facebook/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  # match 'users/sign_out' => "devise/sessions#destroy", via: [:get, :post]


end
