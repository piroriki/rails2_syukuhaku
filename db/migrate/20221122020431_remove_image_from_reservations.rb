class RemoveImageFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :image, :string
  end
end
