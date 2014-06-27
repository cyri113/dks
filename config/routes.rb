Dokspot::Application.routes.draw do
  
  get "products/show"
  devise_for :users
  
  root 'home#index'
  
  get 'about' => 'home#about'
	get 'contact' => 'home#contact'
	
	resources :products, only: :show, path: ""

end
