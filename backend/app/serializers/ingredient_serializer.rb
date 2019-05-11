class IngredientSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :good
  belongs_to :recipe
  attributes :quantity_amount, :quantity_unit
end
