class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.string :name
      t.timestamps
    end

    create_table :pools_users, id: false do |t|
      t.belongs_to :pool
      t.belongs_to :user
    end
  end
end