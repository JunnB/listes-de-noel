class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gift, null: true, foreign_key: true
      t.string :title
      t.text :body
      t.boolean :read, default: false
      t.timestamps
    end
  end
end