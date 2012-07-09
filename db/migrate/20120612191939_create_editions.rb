class CreateEditions < ActiveRecord::Migration
  def change
    create_table :editions do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
