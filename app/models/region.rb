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
#  store_id         :bigint           not null
#
# Indexes
#
#  index_regions_on_store_id  (store_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#
class Region < ApplicationRecord
  belongs_to :store
  has_many :product_sets
  has_many :products, through: :product_sets

  validates :title, presence: true
  validates :currency_details, presence: true
  validates :country_details, presence: true
end
