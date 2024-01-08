class AddCommentToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :comment, :text
  end
end
