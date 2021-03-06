class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title,  null: false
      t.integer :weight, default: 0
      t.string :ancestry

      t.timestamps
    end
    add_index :categories, :title
    add_index :categories, :ancestry
  end
end
