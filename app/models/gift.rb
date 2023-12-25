class Gift < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :gift_responsibles, dependent: :destroy
  has_many :buyers, through: :gift_responsibles, source: :user
  belongs_to :user
  enum status: { in_vote: "in_vote", paid: "paid", partial_payment: "partial_payment", gifted: "gifted" }
end
