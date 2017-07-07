class Track < ApplicationRecord
  belongs_to :admin
  has_many :order_items

  validates :name, presence: true
  validates :price, presence: true
end
