Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
root "home#index"
get "/register", to: "register#new"
post "/register", to: "register#create"

get "/blogposts", to: "blogposts#new"
post "/blogposts", to: "blogpots#create"

get "/userlogin", to: "userlogin#new"
post "/userlogin", to: "userlogin#create"
delete "logout", to: "userlogin#destroy"

get "/resetpassword", to: "resetpassword#index"
patch "/resetpassword", to: "resetpassword#update"

get "/dashboard", to: "dashboard#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
