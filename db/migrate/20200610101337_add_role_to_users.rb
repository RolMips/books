# db/migrate/*_add_role_to_users.rb
class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :string
  end
end
