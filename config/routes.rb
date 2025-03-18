Rails.application.routes.draw do
  # 首页
  root "recipes#index"

  # 用户注册和管理
  get "signup", to: "users#new"
  resources :users, except: [ :index, :destroy ]
  get "favorites", to: "users#favorites"

  # 会话控制（登录/登出）
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  # 食谱路由，包含嵌套资源
  resources :recipes do
    resources :ingredients, only: [ :create, :update, :destroy ]
    resources :steps, only: [ :create, :update, :destroy ]

    # 收藏功能
    member do
      post "favorite"
      delete "unfavorite"
    end
  end
end
