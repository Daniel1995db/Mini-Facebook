class User < ApplicationRecord
	has_many :posts
	has_many :comments
	has_many :followers, class_name: "Following" #, foreign_key: :follower_id
	has_many :followees, class_name: "Following" #, foreign_key: :followee_id

	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
