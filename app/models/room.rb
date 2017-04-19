# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  beds        :integer
#  guests      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_url   :string
#

class Room < ActiveRecord::Base
	validates :title, :description, :beds, :guests, :image_url, presence: true
	validates :description, length: { maximum: 400 }
	validate :field_even?


	def field_even?
		case 
		when guests != nil && !guests.even?
			errors.add(:guests, "is not even")
		when beds != nil && !beds.even?
			errors.add(:beds, "is not even")
		end
	end
end
