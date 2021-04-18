class AddRegionToStore < ActiveRecord::Migration[6.0]
  def change
    add_reference :stores, :region, null: false, foreign_key: true
  end
end
