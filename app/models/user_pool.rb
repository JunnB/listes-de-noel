# app/models/user_pool.rb
class UserPool < ApplicationRecord
  belongs_to :user
  belongs_to :pool
end
