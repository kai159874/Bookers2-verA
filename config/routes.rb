Rails.application.routes.draw do
  get 'rooms/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  root "homes#top"
  get "home/about"=>"homes#about"

  resources :books do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end

  resources :direct_messages, only: [:create]
  resources :rooms, only: [:create, :show]

  get 'search' => "searches#search", as: "search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end