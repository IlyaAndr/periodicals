# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer         not null, primary key
#  start_date :date
#  end_date   :date
#  paid       :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer
#


class Subscription < ActiveRecord::Base

  belongs_to :user

  attr_accessible :start_date, :end_date, :paid, :created_at, :updated_at, :user_id

  has_many :container_items, as: :container,  dependent: :destroy

  after_initialize :default_attributes

  validates :start_date, presence: true, inclusion: {in: (Date.today-1.month)..(Date.today+5.year)}

  validates :end_date, presence: true

  validate :end_date_must_be_later_then_start_date_on_one_month

  def price
  	container_items.inject(0){|total, item| total + item.price}
  end

  def end_date_must_be_later_then_start_date_on_one_month
    errors.add(:end_date, "End date must be later of start date for one month") if end_date < start_date + 1.month
  end

  def default_attributes
    paid = false if paid.nil?
  end

end

