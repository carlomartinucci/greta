class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :season
      t.integer :course

      t.timestamps
    end
  end
end
