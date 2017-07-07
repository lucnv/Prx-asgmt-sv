Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "admin/branches#index"
  namespace :admin do
    root "branches#index"
    resources :branches, only: :index
    resources :categories, only: :index
    resources :products, only: :index
  end
end
