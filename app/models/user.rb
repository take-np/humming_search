class User < ActiveRecord::Base
  validates :email, {presence: true}
  validates :name, {uniqueness: true, presence: true}
  validates :password, {presence: true}
end
