class Post < ActiveRecord::Base
  # コメント追加するための機能。バグがでれば削除
  # belongs_to :user
  # has_many :comments, dependent: :delete_all
end
