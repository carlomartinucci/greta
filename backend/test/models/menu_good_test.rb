# == Schema Information
#
# Table name: menu_goods
#
#  id         :bigint(8)        not null, primary key
#  good_id    :bigint(8)
#  menu_id    :bigint(8)
#  quantity   :integer
#  course     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MenuGoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
