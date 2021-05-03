class Book < ApplicationRecord
  belongs_to :user
  has_many:favorites,dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id:user.id).exists?
  end
  has_many :post_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true,length:{maximum:200}
end
