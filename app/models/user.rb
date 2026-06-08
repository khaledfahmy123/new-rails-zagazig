class User < ApplicationRecord
  # Creator 1:M Post
  has_many :posts, foreign_key: :creator_id, dependent: :destroy

  # Post M:M Editor
  has_many :post_editors, foreign_key: :editor_id, dependent: :destroy
  has_many :edited_posts, through: :post_editors, source: :post
end
