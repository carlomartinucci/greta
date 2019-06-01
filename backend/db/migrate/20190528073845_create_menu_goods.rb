class CreateMenuGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_goods do |t|
      t.references :good, foreign_key: true
      t.references :menu, foreign_key: true
      t.integer :quantity
      t.integer :course

      t.timestamps
    end
  end
end
