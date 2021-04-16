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
end
