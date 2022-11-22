class AddReserveImageToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :reserve_image, :string
  end
end
