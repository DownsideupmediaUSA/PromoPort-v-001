Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"

  resources :artists, only: [:show, :index] do
    resources :songs, only: [:show, :index]
  end
  resources :dashboard
  resources :users
  resources :songs, only: [:index,:show, :new, :create, :edit, :update]
  resources :comments
  resources :genres


  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'sign_out', to: 'sessions#destroy', as: 'sign_out', via: [:get, :post]
end
