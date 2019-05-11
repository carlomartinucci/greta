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

class Ingredient < ApplicationRecord
  belongs_to :good
  belongs_to :recipe

  def serialized_json(options = {})
    options.reverse_merge!(is_collection: false, include: %i[good recipe])
    ingredient = self.class.where(id: id).includes(options[:include]).first
    IngredientSerializer.new(ingredient, options).serialized_json
  end

  def self.serialized_json(options = {})
    options.reverse_merge!(is_collection: true, include: %i[good recipe])
    ingredients = current_scope.includes(options[:include])
    IngredientSerializer.new(ingredients, options).serialized_json
  end
end
