class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :amigo, class_name: 'User'

	def reversable_friendship friend
		if friend && user_id == friend.id
			amigo
		else
			user
		end
	end
end
