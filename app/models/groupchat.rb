class Groupchat < ApplicationRecord
  belongs_to :group
  has_many :user, :through => :group
  belongs_to :messenger, class_name: "User" 
  belongs_to :receiver, class_name: "User" 

end