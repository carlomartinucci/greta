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

class Menu < ApplicationRecord
  belongs_to :shopping
  has_many :menu_goods
  # accepts_nested_attributes_for :menu_goods
  has_many :goods, through: :menu_goods

  def serialized_json(options = {})
    options.reverse_merge!(is_collection: false, include: %i[menu_goods goods])
    menu = self.class.where(id: id).includes(options[:include]).first
    MenuSerializer.new(menu, options).serialized_json
  end

  def self.serialized_json(options = {})
    options.reverse_merge!(is_collection: true, include: %i[menu_goods goods])
    menus = current_scope.includes(options[:include])
    MenuSerializer.new(menus, options).serialized_json
  end
end
