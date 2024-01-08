class ChangeDefaultStatusInGiftsToAvailable < ActiveRecord::Migration[6.0]
  def up
    change_column_default :gifts, :status, from: "in_vote", to: "available"
  end

  def down
    change_column_default :gifts, :status, from: "available", to: "in_vote"
  end
end