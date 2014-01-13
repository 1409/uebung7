class Tak < ActiveRecord::Base
validates :name, presence: true
validates :deadline, presence: true
validates :duration, presence: true, numericality: true 
	def is_delayed?
 		self.deadline < Date.today
	end
end
