class Post < ApplicationRecord
	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :tags, through: :post_tags
	
	attachment :image

  validates :title, presence: true
  validates :body, presence: true

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
