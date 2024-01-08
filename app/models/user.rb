class User < ApplicationRecord
  rolify
  include AvatarConcern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :name, presence: true
  has_many :gifts, dependent: :destroy

  has_many :user_pools
  has_many :pools, through: :user_pools
  has_many :offers, dependent: :destroy
  has_many :gift_buyers
  has_many :gifts_to_buy, through: :gift_buyers, source: :gift
  has_many :proposed_gifts, class_name: "Gift", foreign_key: "proposer_id"
end
