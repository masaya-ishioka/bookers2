Rails.application.routes.draw do
  devise_for :users
	root "users#top"
	get "/about" => "users#about"
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :users, only:[:show, :edit, :update, :index,:create]
    resources :books, only:[:new, :create,:index,:show,:edit,:update,:destroy]
end
