class AddNameToAvatar < ActiveRecord::Migration[7.1]
  def change
    add_column :avatars, :name, :string
  end
end
