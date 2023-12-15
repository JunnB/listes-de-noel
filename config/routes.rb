Rails.application.routes.draw do
  resources :gifts, only: [:index, :create, :update, :show]
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations",
    unlocks: "users/unlocks"
  }
  root "pages#home"
  resources :pools
end
