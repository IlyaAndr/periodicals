class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :paid

      t.timestamps
    end
  end
end
