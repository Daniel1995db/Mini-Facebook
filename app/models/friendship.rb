class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :amigo, class_name: 'User'
end
