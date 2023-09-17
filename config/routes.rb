Rails.application.routes.draw do
  get "homes/home"
  root "homes#home"
end
