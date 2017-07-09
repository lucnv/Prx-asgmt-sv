Rails.application.routes.draw do
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  namespace :admin do
    root "branches#index"
    resources :branches, only: :index
    resources :categories, only: :index
    resources :products, only: :index
    resources :employees, only: :index
    resources :customers, only: :index
    resources :synchronization_logs, only: :index
    resources :orders, only: [:index, :show]
  end

   resources :branches, only: :show do
    resources :branch_products, only: :index
    resources :employees, only: :index
    resources :customers, only: :index
    resources :synchronization_logs, only: :index
    resources :orders, only: [:index, :show]
  end

  namespace :api do
    resources :auths, only: :create
    resources :sync_branches, only: [:create, :destroy]
  end
  get "/*page", to: "static_pages#show"
  root "static_pages#show", page: "home"
end
