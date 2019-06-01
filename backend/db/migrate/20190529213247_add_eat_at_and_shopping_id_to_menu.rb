class AddEatAtAndShoppingIdToMenu < ActiveRecord::Migration[5.2]
  def change
    add_reference :menus, :shopping, foreign_key: true
    add_column :menus, :eat_at, :datetime
  end
end
