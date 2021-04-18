# == Schema Information
#
# Table name: regions
#
#  id               :bigint           not null, primary key
#  country_details  :text
#  currency_details :text
#  tax_details      :text
#  title            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'test_helper'

class RegionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
