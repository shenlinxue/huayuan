class RemoveWeightFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :Weight, :integer
  end
end
