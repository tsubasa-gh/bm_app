Rails.application.routes.draw do
  get 'static_pages/home'
  root   'static_pages#home'
  get    "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  get 'static_pages/past', to: "static_pages#past"
  resources :users do
    resources :foods
    resources :daily_records
    resources :daily_weights, only: [:create, :destroy, :new]
  end
end
