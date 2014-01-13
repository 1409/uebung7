require 'test_helper'

class TakTest < ActiveSupport::TestCase
	test "tak can not be saved without name" do
		tak = Tak.new
		assert !tak.save
	end
	test "tak can be saved with name, deadline and duraton" do
		tak = Tak.new
		tak.name = "Eine Aufgabe"
		tak.deadline = Date.today + 7.days
		tak.duration = 5.0
		assert tak.save
	end 
end

