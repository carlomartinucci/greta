Rails.application.routes.draw do
  resources :shoppings
  resources :menu_goods
  resources :menus
  post '/graphql', to: 'graphql#execute'

  resources :recipes
  resources :goods
  resources :ingredients
end
