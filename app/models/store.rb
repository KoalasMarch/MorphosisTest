# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Store < ApplicationRecord
  has_one :region
end
