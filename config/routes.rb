Rails.application.routes.draw do
  root "homes#home"
  get  "/signup",    to: "users#new"
end
