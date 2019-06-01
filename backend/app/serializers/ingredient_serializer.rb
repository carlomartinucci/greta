# == Schema Information
#
# Table name: ingredients
#
#  id              :bigint(8)        not null, primary key
#  good_id         :bigint(8)
#  recipe_id       :bigint(8)
#  quantity_amount :float
#  quantity_unit   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class IngredientSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :good
  belongs_to :recipe
  attributes :quantity_amount, :quantity_unit
end
