class AddMemberIdToRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :member_id, :integer
  end
end
