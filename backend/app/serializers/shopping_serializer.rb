# == Schema Information
#
# Table name: menus
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  shopping_id :bigint(8)
#  eat_at      :date
#

class ShoppingSerializer
  include FastJsonapi::ObjectSerializer
  has_many :menus

  attribute :purchased do |obj|
    obj.purchased_at&.to_f
  end
end
