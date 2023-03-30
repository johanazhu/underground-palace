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

  

  # 复数形式
  # resources :articles
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end

  # resources :settings, only: [:index, :update]
  # 单数形式
  resource :settings, only: [:show, :update]


  # get '/:name', to: 'profile#show', as: :profile

  # scope :profiles do
  #   get ':username', to: 'profiles#show', as: :profile
  #   post ':username/follow', to: 'profiles#follow', as: :follow_user
  #   delete ':username/follow', to: 'profiles#unfollow', as: :unfollow_user
  # end

  scope :profiles do
    # 显示用户资料页面
    get ':username', to: 'profiles#show', as: :user_profile
  
    # 关注用户
    post ':username/follow', to: 'profiles#follow', as: :follow_user
  
    # 取消关注用户
    delete ':username/follow', to: 'profiles#unfollow', as: :unfollow_user
  end

  # , only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  # root "rails/welcome#index"
end
