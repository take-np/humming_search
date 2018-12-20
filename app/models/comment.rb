# class Comment < ActiveRecord::Base
#   #  belongs_to :user
#   # belongs_to :post
#   # コメント追加するための機能。バグがでれば削除
#   validates :user_id, presence: true
#   validates :content, presence: true,length:{maximum:100}
#
#   belongs_to :user
#   belongs_to :post
#
#   counter_culture :post
#
#   has_many :replies,class_name:'Comment',foreign_key: :parent_id,dependent: :destroy
#   belongs_to :parent,class_name:'Comment',optional:true
# end
