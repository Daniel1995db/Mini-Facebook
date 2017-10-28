class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



	has_many :posts
	has_many :comments
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages
	has_many :followers, class_name: "Following" #, foreign_key: :follower_id
	has_many :followees, class_name: "Following" #, foreign_key: :followee_id
	belongs_to :group, optional: true
	has_many :managed_groups, class_name: 'Group'
	has_many :friendships
  	has_many :amigos, through: :friendships, class_name: 'User'

	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

	def los_amigos
    	@user.amigos + ActiveRecord::Base.connection.select_all("SELECT a.* FROM user u JOIN friendship f ON u.id = f.amigo_id JOIN user a ON f.user_id = a.id")
  	end

  	def self.search(search)
  		where("fname LIKE ? OR lname LIKE ?", "%#{search}%", "%#{search}%") 
  		# where("content LIKE ?", "%#{search}%")
	end
	def full_name
		"#{fname} #{lname}".strip
	end
end

