class AddProposerToGifts < ActiveRecord::Migration[6.0]
  def change
    add_reference :gifts, :proposer, null: false, foreign_key: { to_table: :users }
  end
end