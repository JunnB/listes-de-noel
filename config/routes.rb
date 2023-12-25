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

  resources :gifts, only: [:index, :create, :update, :show]
  root "pages#home"
  resources :pools
end
