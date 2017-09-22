class AddAttachmentAvatarToBanners < ActiveRecord::Migration
  def self.up
    change_table :banners do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :banners, :avatar
  end
end
