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

class MenuGoodSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :good
  belongs_to :menu
  attributes :quantity, :course
end
