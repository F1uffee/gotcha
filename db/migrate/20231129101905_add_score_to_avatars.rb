class AddScoreToAvatars < ActiveRecord::Migration[7.1]
  def change
    add_column :avatars, :score, :integer, default: 0, null: false
  end
end
