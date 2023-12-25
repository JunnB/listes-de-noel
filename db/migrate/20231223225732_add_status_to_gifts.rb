class AddStatusToGifts < ActiveRecord::Migration[7.0]
  def change
    add_column :gifts, :status, :string
  end
end
