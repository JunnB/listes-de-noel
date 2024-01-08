class Offer < ApplicationRecord
  before_save :update_current_offer
  before_create :set_default_status
  enum status: { money_send_to_buyers: "money_send_to_buyers", paid: "paid", payment_due: "payment_due" }
  belongs_to :user
  belongs_to :gift

  private

  def set_default_status
    self.status ||= :payment_due
  end

  def update_current_offer
    offer = Offer.where(gift_id: gift_id, user: user).first
    self.attributes = offer.attributes if offer
  end
end
