module Types
  class GoodType < Types::BaseObject
    description 'A good'
    field :id, ID, null: false
    field :name, String, null: true
    field :shelf, String, null: true
    field :ingredients, [Types::IngredientType], null: true, description: 'The ingredients made with this good'
    field :recipes, [Types::RecipeType], null: true, description: 'The recipes made with this good'
  end
end
