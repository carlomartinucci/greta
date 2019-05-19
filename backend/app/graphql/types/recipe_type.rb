module Types
  class RecipeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :season, String, null: true
    field :course, String, null: true
    field :ingredients, [Types::IngredientType], null: true
    field :goods, [Types::GoodType], null: true
  end
end
