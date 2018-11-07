Rails.application.routes.draw do
  devise_for :users
	root "users#top"
	get "/about" => "users#about"
	resources :books, only:[:new, :create,:index,:show,:edit,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :users, only:[:show, :edit, :update, :index,]
end
