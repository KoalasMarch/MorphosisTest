class RemoveStoreFromRegions < ActiveRecord::Migration[6.0]
  def change
    remove_reference :regions, :store, null: false, foreign_key: true
  end
end
