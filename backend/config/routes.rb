Rails.application.routes.draw do
  resources :shoppings
  resources :shopping_lists, only: [:index, :create] do
    collection do
      get :current
    end
  end
  resources :menus
  post '/graphql', to: 'graphql#execute'

  resources :recipes
  resources :goods
  resources :ingredients
end
