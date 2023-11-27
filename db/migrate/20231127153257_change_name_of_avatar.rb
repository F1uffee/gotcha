class ChangeNameOfAvatar < ActiveRecord::Migration[7.1]
  def change
    rename_column :avatars, :avatar, :url
  end
end
