class AddUrlToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :url, :string
  end
end
