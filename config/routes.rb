Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
root "blogposts#index"
get "/user_posts", to: "blogposts#user_posts", :as => 'myposts'
get "/favorite", to: "blogposts#show_favorite",  :as => 'mylikedposts'
# get "/homes", to:"homes#index"
resources :bloggers 
resources :blogposts do
  put :favorite, on: :member
  resources :comments
end
get "/register", to: "register#new"
post "/register", to: "register#create"

get "/userlogin", to: "userlogin#new"
post "/userlogin", to: "userlogin#create"
delete "/logout", to: "userlogin#destroy"

get "/resetpassword", to: "resetpassword#index"
patch "/resetpassword", to: "resetpassword#update"
get "/dashboard", to: "dashboard#index"
  # root "articles#index"
end
