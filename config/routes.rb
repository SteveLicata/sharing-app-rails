Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #welcome route
  root "welcome#home", as: "home_page"

  #user route
  get "/users/:id" => "users#show", as: "user"

  #user routes
  resources :users

end
