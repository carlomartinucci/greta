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

require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
