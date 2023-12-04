class AddColorToAvatars < ActiveRecord::Migration[7.1]
  def change
    add_column :avatars, :color, :string
  end
end
