class CreateContainerItems < ActiveRecord::Migration
  def change
    create_table :container_items do |t|
      t.references :container, polymorphic: true
      t.references :edition
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
