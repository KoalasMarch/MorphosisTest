# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  price       :float
#  sku         :text
#  title       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
