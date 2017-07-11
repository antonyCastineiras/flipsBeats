class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  def completed_orders
  	orders.where('order_status_id = 4')
  end

  def purchased_tracks
  	completed_orders.collect {|order| 
  		order.order_items.collect {|order_item| 
  			order_item.track }
  	}.flatten.uniq
  end

  def has_purchased?(track)
  	purchased_tracks.include?(track)
  end
end
