class AddPoolToGifts < ActiveRecord::Migration[7.0]
  def change
    add_reference :gifts, :pool, null: false, foreign_key: true
  end
end
