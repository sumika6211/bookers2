Rails.application.routes.draw do
  devise_scope :user do
    post "users/guest_sign_in", to: "users#guest_sign_in"
  end
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about", as: "about"
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
