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

class MenuSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :shopping
  has_many :menu_goods

  attribute :eat do |obj|
    obj.eat_at&.to_f
  end
end
