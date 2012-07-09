class AddAttachmentImageToEditions < ActiveRecord::Migration
  def self.up
    change_table :editions do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :editions, :image
  end
end
