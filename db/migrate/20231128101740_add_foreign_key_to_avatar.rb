class AddForeignKeyToAvatar < ActiveRecord::Migration[7.1]
  def change
    add_reference :avatars, :user, foreign_key: true
  end
end
