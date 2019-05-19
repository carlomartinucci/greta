module Types
  class IngredientType < Types::BaseObject
    description 'An ingredient'
    field :id, ID, null: false
    field :quantity_amount, Float, null: true
    field :quantity_unit, String, null: true
    field :good, Types::GoodType, null: true
    field :recipe, Types::RecipeType, null: true
  end
end
