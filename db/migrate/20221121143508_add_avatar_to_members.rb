class AddAvatarToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :avatar, :string
  end
end
