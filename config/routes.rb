Dokspot::Application.routes.draw do
  
  devise_for :users
  
  root 'home#index'
  
  get 'about' => 'home#about'
	get 'contact' => 'home#contact'

end
