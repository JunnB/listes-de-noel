class Pool < ApplicationRecord
  include AvatarConcern
  has_many :gifts, dependent: :destroy
  has_many :user_pools
  has_many :users, through: :user_pools
end
