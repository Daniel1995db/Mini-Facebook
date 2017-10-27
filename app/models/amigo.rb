class Amigo < ApplicationRecord
	belongs_to :user, :foreign_key => 'user_id'
	belongs_to :friendship, :foreign_key => 'user_id'
end
