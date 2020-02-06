class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :post

	def favorited_by?
		favorites.where(user_id: user.id).exists?
	end
end
