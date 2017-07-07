class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_items
  before_validation :set_order_status, on: :create
  before_save :update_subtotal

  def subtotal
  	order_items.collect {|oi| oi.valid? ? oi.unit_price : 0 }.sum
  end

	private

  def set_order_status
  	self.order_status_id = 1
  end

  def update_subtotal
  	self[:subtotal] = subtotal
  end
end
