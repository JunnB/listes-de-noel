class RenameUserIdToRecipientIdInGifts < ActiveRecord::Migration[6.0]
  def change
    rename_column :gifts, :user_id, :recipient_id
  end
end