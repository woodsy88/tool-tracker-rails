Rails.application.routes.draw do
  

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :tools
  resources :topics

  get 'pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
