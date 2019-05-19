Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'

  resources :recipes
  resources :goods
  resources :ingredients
end
