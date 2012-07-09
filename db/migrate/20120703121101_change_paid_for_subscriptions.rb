class ChangePaidForSubscriptions < ActiveRecord::Migration
  def self.up
    change_table :subscriptions do |t|
      t.change :paid, :boolean, default: false
    end
  end
  def self.down
    change_table :subscriptions do |t|
      t.change :paid, :boolean,  default: nil
    end
  end
end
