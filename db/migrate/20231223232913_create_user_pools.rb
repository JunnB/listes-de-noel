class CreateUserPools < ActiveRecord::Migration[7.0]
  def change
    create_table :user_pools do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pool, null: false, foreign_key: true

      t.timestamps
    end
  end
end
