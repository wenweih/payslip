class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :annual_salary, :integer
    add_column :users, :super_rate, :decimal, precision: 5, scale: 2
  end
end
