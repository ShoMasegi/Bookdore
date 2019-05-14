class Card < ApplicationRecord
  validates :book,
            presence: true,
            length: { maximum: 50 },
            uniqueness: true
  validates :status,
            presence: true,
            length: { maximum: 100 }
  validates :deadline,
            presence: true
end
