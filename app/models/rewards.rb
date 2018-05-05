class Rewards < ActiveRecord::Base
	belongs_to :customer 

	validates_presence_of :reward_points, :reserved_by
	validates :reward_points, :numricality => {:only_integer => true}
	validates_length_of :reward_points, minimum: 0, maximum: 10
end
