Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations",
    unlocks: "users/unlocks"
  }

  constraints lambda { |request| request.env["HTTP_AUTHORIZATION"].present? } do
    mount Motor::Admin => "/motor_admin"
  end

  resources :gifts, only: [:index, :new, :create, :update, :show]
  root "pages#home"
  resources :pools
  resources :offers
  post "/pools/:pool_id/users/:user_id", to: "pools#join", as: "join_pool"
  delete "/pools/:pool_id/users/:user_id", to: "pools#unjoin", as: "unjoin_pool"
end
