class Track < ApplicationRecord
  belongs_to :admin

  validates :name, presence: true
  validates :price, presence: true
end
