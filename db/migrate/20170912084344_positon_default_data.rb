class PositonDefaultData < ActiveRecord::Migration[5.0]
  def change
  	Category.order(:updated_at).each.with_index(1) do |todo_item, index|
      todo_item.update_column :position, index
    end
  end
end
