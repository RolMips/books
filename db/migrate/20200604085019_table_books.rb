class TableBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books
    add_column :books, :title, :string
  end
end
