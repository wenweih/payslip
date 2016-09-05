class AddAccessLevelToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :access_lever, :integer
    add_column  :users, :admin, :integer
  end
end
