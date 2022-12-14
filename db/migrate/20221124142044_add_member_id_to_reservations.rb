class AddMemberIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :member_id, :integer
  end
end
