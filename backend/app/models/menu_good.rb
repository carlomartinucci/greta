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

class MenuGood < ApplicationRecord
  belongs_to :good
  belongs_to :menu
  accepts_nested_attributes_for :good

  enum course: %w[colazione pranzo cena merenda]
end
