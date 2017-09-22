class AddStatusToBanner < ActiveRecord::Migration[5.0]
  def change
    add_column :banners, :status, :boolean, default: 1
  end
end
