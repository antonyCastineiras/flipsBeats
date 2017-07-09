class Track < ApplicationRecord
	mount_uploader :music_file, MusicFileUploader

  belongs_to :admin
  has_many :order_items

  validates :name, presence: true
  validates :price, presence: true
end
