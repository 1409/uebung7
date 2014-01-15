class User < ActiveRecord::Base
	has_many :delegated_taks, class_name: "Task", foreign_key: "delegated_id"
	has_many :taks
	validates :username, presence:  true, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
