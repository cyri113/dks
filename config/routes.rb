Dokspot::Application.routes.draw do
  
	devise_for :users, :skip => [:registrations]
  
  resources :users, :except => [:new, :create]
  
  root 'home#index'
  
  get 'about' => 'home#about'
	get 'contact' => 'home#contact'
	get 'search' => 'products#search'
	
	resources :products, only: :show, path: ""

end
