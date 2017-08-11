class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :directions, presence: true

  has_many :doses, dependent: :destroy, inverse_of: :cocktail
  has_many :ingredients, through: :doses

  accepts_nested_attributes_for :doses, reject_if: :all_blank, allow_destroy: true
end
