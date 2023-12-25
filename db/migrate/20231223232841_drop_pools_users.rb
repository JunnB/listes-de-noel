class DropPoolsUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :pools_users
  end
end