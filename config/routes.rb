Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parks, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      put "add_favorite", to: "parks#add_favorite", as: :add_favorite
      put "remove_favorite", to: "parks#remove_favorite", as: :remove_favorite
      post "toggle_favorite", to: "parks#toggle_favorite", as: :toggle_favorite
    end
  end

  # The member scopes ensure that the id of the favourite is passed into the action

  resources :users, only: :show
end
