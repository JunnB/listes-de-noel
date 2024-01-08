class RenameGiftResponsiblesToGiftBuyers < ActiveRecord::Migration[6.0]
  def change
    rename_table :gift_responsibles, :gift_buyers
  end
end