class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.references :good, foreign_key: true
      t.references :recipe, foreign_key: true
      t.float :quantity_amount
      t.string :quantity_unit

      t.timestamps
    end
  end
end
