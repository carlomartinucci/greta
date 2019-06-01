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

class Good < ApplicationRecord
  has_many :menu_goods, dependent: :destroy
  has_many :menus, through: :menu_goods

  def serialized_json(options = {})
    options.reverse_merge!(is_collection: false)
    good = self.class.where(id: id).includes(options[:include]).first
    GoodSerializer.new(good, options).serialized_json
  end

  def self.serialized_json(options = {})
    options.reverse_merge!(is_collection: true)
    goods = current_scope.includes(options[:include])
    GoodSerializer.new(goods, options).serialized_json
  end
end
