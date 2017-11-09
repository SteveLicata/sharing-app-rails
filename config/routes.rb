Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #welcome route
  root "welcome#home", as: "home_page"

  #user route
  get "/users/:id" => "users#show", as: "user"

  #view posts shared by other user route
  get "/posts/shared_posts" => "posts#shared_posts", as: "shared_posts"

  get	"/posts/:id/edit(.:format)" =>	"posts#edit", as: "edit_posts_path"

  #user routes
  resources :users

  #post routes
  resources :posts

  resources :conversations, only: [:index, :show, :new, :create] do
   member do
     post :reply
     post :trash
     post :untrash
   end
 end

end
