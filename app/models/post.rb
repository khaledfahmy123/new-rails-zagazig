class Post < ApplicationRecord
  # Creator 1:M Post
  belongs_to :creator, class_name: 'User'

  # Post M:M Editor
  has_many :post_editors, dependent: :destroy
  has_many :editors, through: :post_editors
end
