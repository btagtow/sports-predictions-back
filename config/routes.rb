Rails.application.routes.draw do
  resources :game_selections
  resources :users, only: [:index, :show, :create, :update]

  post "/login", to: "authentication#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
