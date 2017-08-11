class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :directions, presence: true

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
end
