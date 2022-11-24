class AddStartedDayToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :started_day, :datetime
  end
end
