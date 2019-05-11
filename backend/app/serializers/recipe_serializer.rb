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

class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  has_many :ingredients
  has_many :goods

  attributes :name, :season, :course
end
