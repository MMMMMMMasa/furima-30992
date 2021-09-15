Rails.application.routes.draw do
  get 'purchase_record/index'
  devise_for :users
  root to: "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :items do
    resources :orders, only: [:index, :create]
  end
end
