Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "admin-dashboard", to: "users#admin_dashboard", as: :admin_dashboard
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parks, only: [:index, :show, :new, :create, :edit, :update] do
    resources :reviews, only: [:new, :create]
    # The member scopes ensure that the id of the favourite is passed into the action
    member do
      post "toggle_favorite", to: "parks#toggle_favorite", as: :toggle_favorite
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :facilities, only: [:new, :create, :destroy]
end
