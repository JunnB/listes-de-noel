class AddPrimaryKeyToPoolsUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :pools_users, :id, :primary_key
  end
end