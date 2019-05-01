class RemoveUserIdFromGasstations < ActiveRecord::Migration[5.2]
  def change
    remove_column :gasstations, :user_id, :integer
  end
end
