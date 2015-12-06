Sonderfly::Application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts do
  	member do
  		get "like", to: "posts#upvote"
  	end
  	resources :comments
  end

  root 'posts#index'
end
