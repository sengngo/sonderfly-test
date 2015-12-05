Sonderfly::Application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts

  root 'posts#index'
end
