Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #

  #이렇게 하면 대문 페이지가 설정이 된다.
  root 'pages#home'
  get 'about', to:'pages#about'

end
