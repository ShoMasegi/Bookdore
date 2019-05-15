class Card < ApplicationRecord
  enum status: [:want, :bought, :reading, :read]
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
