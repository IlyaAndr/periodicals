# == Schema Information
#
# Table name: editions
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  price       :decimal(, )
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Edition < ActiveRecord::Base

  attr_accessible :title, :description, :price, :created_at, :updated_at

  attr_accessible :image, :kind_ids

  has_attached_file :image, :styles => { :medium => "400x400>", :thumb => "100x100>" }

  has_and_belongs_to_many :kinds

  has_many :container_items, dependent: :destroy

  has_many :subscriptions, source: :container, source_type: "Subscription", through: :container_items

  validates :title, presence: true, length: {in: 2..30}

  validates :description, length: {in: 20..600}

  validates :price, presence: true, numericality: {greater_than_or_equal_to: 1, less_than: 2000}

  validates_attachment :image,# :presence => true,
  :content_type => { :content_type => ["image/jpg", "image/png", "image/jpeg"] },
  :size => { :in => 0..1.megabyte }

  validates_associated :container_items, :kinds

  searchable do
    text :title, :description
    text :kinds do
      kinds.map { |kind| kind.name }
    end
    double  :price
    time    :created_at
    time    :updated_at
  end

  
  
end


