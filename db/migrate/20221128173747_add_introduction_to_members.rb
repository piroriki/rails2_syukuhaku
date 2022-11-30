class AddIntroductionToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :introduction, :string
  end
end
