# == Schema Information
#
# Table name: recipes
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  season     :integer
#  course     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recipe < ApplicationRecord
  enum season: %w[inverno primavera estate autunno]
  enum course: %w[colazione pranzo cena merenda]

  has_many :ingredients
  has_many :goods, through: :ingredients

  def serialized_json(options = {})
    options.reverse_merge!(is_collection: false, include: %i[ingredients goods])
    recipe = self.class.where(id: id).includes(options[:include]).first
    RecipeSerializer.new(recipe, options).serialized_json
  end

  def self.serialized_json(options = {})
    options.reverse_merge!(is_collection: true, include: %i[ingredients goods])
    recipes = current_scope.includes(options[:include])
    RecipeSerializer.new(recipes, options).serialized_json
  end
end
