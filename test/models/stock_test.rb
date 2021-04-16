# == Schema Information
#
# Table name: stocks
#
#  id           :bigint           not null, primary key
#  stock_number :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  product_id   :bigint           not null
#
# Indexes
#
#  index_stocks_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
require 'test_helper'

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
