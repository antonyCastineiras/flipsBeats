class OrderItem < ApplicationRecord
  belongs_to :track
  belongs_to :order

  validate :track_present
  validate :order_present

  before_save :finalize

  def unit_price
  	if persisted?
  		self[:unit_price]
  	else
  		track.price
  	end
  end

	private
	
	def track_present
		errors.add(:track, "is not valid or not active") if track.nil?
	end

	def order_present
		errors.add(:order, "is not a valid order") if order.nil?
	end

	def finalize
		self[:unit_price] = unit_price
	end
end
