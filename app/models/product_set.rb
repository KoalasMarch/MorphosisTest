# == Schema Information
#
# Table name: product_sets
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  region_id  :bigint           not null
#
# Indexes
#
#  index_product_sets_on_product_id  (product_id)
#  index_product_sets_on_region_id   (region_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (region_id => regions.id)
#
class ProductSet < ApplicationRecord
  belongs_to :product
  belongs_to :region
end
