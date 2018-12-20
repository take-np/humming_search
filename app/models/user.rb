class User < ActiveRecord::Base
  validates :email, {presence: true}
  validates :name, {uniqueness: true, presence: true}
  validates :password, {presence: true}
  # # コメント追加するための機能。バグがでれば削除
  # has_many :comments
  # has_many :posts,dependent: :destroy
end
