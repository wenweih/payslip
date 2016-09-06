class AddNamespaceRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :namespace, foreign_key: true
  end
end
