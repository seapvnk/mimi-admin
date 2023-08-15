Rails.application.routes.draw do
  root 'home#index'

  resources :timelines

  resources :worlds do
    resources :maps
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
