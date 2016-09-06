class CreateNamespaces < ActiveRecord::Migration[5.0]
  def change
    create_table :namespaces do |t|
      t.string :name, null: false
      t.string :path, null: false
      t.string :type

      t.timestamps
    end
    add_column :namespaces, :owner_id, :integer, null: false
    add_foreign_key :namespaces,  :users, column: :owner_id
    add_index :namespaces, :path, unique: true
  end
end
