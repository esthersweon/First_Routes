FirstRoutes::Application.routes.draw do
  resources :users, except: [:new, :edit] do
    resources :contacts, only: [:index]
  end

  resources :contacts, only: [:create, :show, :update, :destroy]
  resources :contactshares, only: [:create, :destroy]
end
