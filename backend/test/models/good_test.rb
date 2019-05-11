# == Schema Information
#
# Table name: goods
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  shelf      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
