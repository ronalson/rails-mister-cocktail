class Dose < ApplicationRecord
  validates :quantity, presence: true
  validates_uniqueness_of :ingredient, scope: :cocktail

  belongs_to :cocktail
  belongs_to :ingredient
end
