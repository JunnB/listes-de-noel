class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gift, null: false, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
