class AddPriceToGifts < ActiveRecord::Migration[7.0]
  def change
    add_column :gifts, :price, :decimal
  end
end
