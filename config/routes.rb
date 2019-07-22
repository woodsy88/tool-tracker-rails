Rails.application.routes.draw do
  

  namespace :admin do
      resources :users
      resources :tools
      resources :topics
      resources :admin_users

      root to: "users#index"
    end
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :topics do
    scope module: :topics do
      resources :tools, except: [:new, :create] 
    end
  end

    # url / route      controller              path
  get 'tools/new', to: 'topics/tools#new', as: 'new_tool'
  post 'tools', to: 'topics/tools#create', as: 'create_tool'

  get 'pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
