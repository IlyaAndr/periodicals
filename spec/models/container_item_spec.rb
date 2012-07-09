require 'spec_helper'

describe ContainerItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
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

