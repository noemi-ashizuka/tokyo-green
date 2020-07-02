Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parks, only: [:index, :show, :new, :create, :edit, :update] do
    put "add_favorites", to: "parks#add_favorite", as: :add_favorite
  end

  resources :users, only: :show
end
