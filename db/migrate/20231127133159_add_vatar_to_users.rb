class AddVatarToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :avatar, foreign_key: true
  end
end
