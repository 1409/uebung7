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
	test "is delayed" do
		tak = Tak.new
		tak.deadline = Date.today - 10.days
		assert tak.is_delayed?
	end
	test "is not delayed" do
		tak = Tak.new
		tak.deadline = Date.today + 10.days
		assert !tak.is_delayed?
	end
	test "is not delayed if deadline is today" do
		tak = Tak.new
		tak.deadline = Date.today
		assert !tak.is_delayed?
	end 
	test "destance in days from today" do
		tak = Tak.new
		tak.deadline = Date.today
		assert_equal 0, tak.distance_from_now_in_days
	end

	test "destance in days from yesterday" do
		tak = Tak.new
		tak.deadline = Date.today - 1
		assert_equal -1, tak.distance_from_now_in_days
	end

	test "destance in days from tomorrow" do
		tak = Tak.new
		tak.deadline = Date.today + 1
		assert_equal 1, tak.distance_from_now_in_days
	end 
end

