class AddStartedDayToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :started_day, :datetime
  end
end
