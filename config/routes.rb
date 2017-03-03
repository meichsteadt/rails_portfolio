Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :repos
  resources :user
  resources :landing, :only => [:index]
  resources :about, :only => [:index]

  root to: 'landing#index'
end
