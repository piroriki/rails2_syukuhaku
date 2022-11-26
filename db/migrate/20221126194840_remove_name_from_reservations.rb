class RemoveNameFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :name, :string
  end
end
