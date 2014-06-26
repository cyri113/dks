Dokspot::Application.routes.draw do
  
  devise_for :users
  
  root 'home#index'
  
  get "home/index"
  get "home/about"
  get "home/contact"

end
