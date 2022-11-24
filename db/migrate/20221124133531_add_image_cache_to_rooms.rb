class AddImageCacheToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :image_cache, :string
  end
end
