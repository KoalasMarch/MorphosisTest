# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  address      :text
#  district     :text
#  first_name   :text
#  last_name    :text
#  province     :text
#  status       :text
#  sub_district :text
#  total_price  :float
#  zip_code     :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
end
