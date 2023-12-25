class User < ApplicationRecord
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
  has_many :gift_responsibles
  has_many :owner_gifts, through: :gift_responsibles, source: :gift
end
