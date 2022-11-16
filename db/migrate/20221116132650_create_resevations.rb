class CreateResevations < ActiveRecord::Migration[6.1]
  def change
    create_table :resevations do |t|
      t.string :image
      t.string :name
      t.text :introduction
      t.integer :price
      t.datetime :finished_day

      t.timestamps
    end
  end
end
