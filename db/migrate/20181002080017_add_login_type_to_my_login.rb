class AddLoginTypeToMyLogin < ActiveRecord::Migration[5.2]
  def change
    add_column :my_logins, :login_type, :integer, default: 0, null: false
    add_index :my_logins, :login_type
  end
end
