class UpdateInVoteToAvailableInGifts < ActiveRecord::Migration[6.0]
  def up
    Gift.where(status: "in_vote").update_all(status: "available")
  end

  def down
    Gift.where(status: "available").update_all(status: "in_vote")
  end
end