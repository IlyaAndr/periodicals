# == Schema Information
#
# Table name: kinds
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


class Kind < ActiveRecord::Base

  attr_accessible :name, :created_at, :updated_at

  has_and_belongs_to_many :editions

  validates :name, presence: true, length: {in: 2..30}

end

