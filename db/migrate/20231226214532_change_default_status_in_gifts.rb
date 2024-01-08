class ChangeDefaultStatusInGifts < ActiveRecord::Migration[6.0]
  def up
    change_column_default :gifts, :status, from: nil, to: "in_vote"
  end

  def down
    change_column_default :gifts, :status, from: "in_vote", to: nil
  end
end