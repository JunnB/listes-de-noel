class AddBuyerOfferToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :is_buyer, :boolean
  end
end
