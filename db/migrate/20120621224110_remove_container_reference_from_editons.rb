class RemoveContainerReferenceFromEditons < ActiveRecord::Migration
  def self.up
    remove_column :editions, :container_id
    remove_column :editions, :container_type
  end

  def self.down
    add_column :editions, :container_id, :integer
    add_column :editions, :container_type, :string
  end
end
