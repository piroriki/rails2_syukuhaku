class AddPeopleToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :people, :number
  end
end
