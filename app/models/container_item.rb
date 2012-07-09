# == Schema Information
#
# Table name: container_items
#
#  id             :integer         not null, primary key
#  container_id   :integer
#  container_type :string(255)
#  edition_id     :integer
#  quantity       :integer         default(1)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#


class ContainerItem < ActiveRecord::Base

  belongs_to :container, polymorphic: true
  belongs_to :edition

  attr_accessible :quantity, :container_id, :edition_id

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than: 100 }

  def price
  	edition.price*quantity
  end

end

