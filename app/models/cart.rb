# == Schema Information
#
# Table name: carts
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer
#


class Cart < ActiveRecord::Base

  attr_accessible :user_id, :created_at, :updated_at
  
  belongs_to :user

  has_many :container_items, as: :container, dependent: :destroy

  validates_associated :container_items

  def price
  	container_items.inject(0){|total, item| total + item.price}
  end
  
end

