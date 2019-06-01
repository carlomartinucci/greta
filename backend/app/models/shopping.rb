# == Schema Information
#
# Table name: shoppings
#
#  id           :bigint(8)        not null, primary key
#  purchased_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Shopping < ApplicationRecord
  has_many :menus
  has_many :menu_goods, through: :menus
  has_many :goods, through: :menu_goods

  def serialized_json(options = {})
    options.reverse_merge!(is_collection: false, include: %i[menus menu_goods goods])
    shopping = self.class.where(id: id).includes(options[:include]).first
    ShoppingSerializer.new(shopping, options).serialized_json
  end

  def self.serialized_json(options = {})
    options.reverse_merge!(is_collection: true, include: %i[menus menu_goods goods])
    shoppings = current_scope.includes(options[:include])
    ShoppingSerializer.new(shoppings, options).serialized_json
  end

  def self.menu_goods
    MenuGood.where(menu_id: current_scope.includes(:menus).map(&:menu_ids).flatten)
  end
end
