Sonderfly::Application.routes.draw do
	# get "users/dashboard"
  get "static_pages/welcome"
  get "static_pages/contact"
  get "static_pages/about"
  get "static_pages/guidelines"
  root :to => 'static_pages#welcome'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts do
  	member do
  		get "like", to: "posts#upvote"
  	end
  	resources :comments
  end

end
