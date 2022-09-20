Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
root "home#index"
get "/register", to: "register#new"
post "/register", to: "register#create"

get "/userlogin", to: "userlogin#new"
post "/userlogin", to: "userlogin#create"
delete "logout", to: "userlogin#destroy"

get "/resetpassword", to: "resetpassword#index"
get "/dashboard", to: "dashboard#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
