Rails.application.routes.draw do
  resources :ingredients
  resources :goods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :recipes
  resources :goods
  resources :ingredients
end
