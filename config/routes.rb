Rails.application.routes.draw do
  devise_scope :user do
    post "users/guest_sign_in", to: "users#guest_sign_in"
  end
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followeds', to 'relationships#followeds', as: 'followeds'
    get 'followers', to 'relationships#followers', as: 'followers'
  end
  root to: 'homes#top'
  get "home/about" => "homes#about", as: "about"
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
