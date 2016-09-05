class CreateNamespaces < ActiveRecord::Migration[5.0]
  def change
    create_table :namespaces do |t|
      t.string :name
      t.string :path
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :namespaces, :path, unique: true
  end
end
