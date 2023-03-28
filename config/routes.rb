Rails.application.routes.draw do

  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    sign_up: "register" 
  }, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }
  # 将默认登录路由更改为 /login：
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/register' => 'devise/registrations#new'
  end



  resources :articles

  resources :settings, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  # root "rails/welcome#index"
end
