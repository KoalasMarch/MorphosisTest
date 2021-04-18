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
class Region < ApplicationRecord
  has_many :product_sets
  has_many :products, through: :product_sets

  validates :title, presence: true
  validates :currency_details, presence: true
  validates :country_details, presence: true

  def create_product_sets(product_ids)
    product_ids.each do |product_id|
      ProductSet.create(product_id: product_id, region_id: id)
    end
  end
end
