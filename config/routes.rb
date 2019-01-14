Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #

  #이렇게 하면 대문 페이지가 설정이 된다.
  root 'pages#home'
  get 'about', to:'pages#about'

  #article에 관한 모든 path를 제공한다.
  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]


end
