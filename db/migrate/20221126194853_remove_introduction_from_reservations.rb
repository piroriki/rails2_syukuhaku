class RemoveIntroductionFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :introduction, :string
  end
end
