class CreateEditionsKinds < ActiveRecord::Migration
  def up
    create_table :editions_kinds, :id => false do |t|
      t.column :edition_id, :integer
      t.column :kind_id, :integer
    end
  end

  def down
    drop_table :editions_kinds
  end
end
