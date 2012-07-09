class AddContainerIdToEditions < ActiveRecord::Migration
  def change
    add_column :editions, :container_id, :integer
    add_column :editions, :container_type, :string
  end
end
