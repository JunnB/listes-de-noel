class Gift < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :gift_buyers, dependent: :destroy
  has_many :buyers, through: :gift_buyers, source: :user
  belongs_to :proposer, class_name: "User"
  belongs_to :recipient, class_name: "User"
  belongs_to :pool
  enum status: { available: "available", selected: "selected", paid: "paid", partially_paid: "partially_paid", gifted: "gifted" }
end
