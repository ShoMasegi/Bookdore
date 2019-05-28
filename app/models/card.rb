class Card < ApplicationRecord
  enum status: [:want, :bought, :reading, :read]

  validates :deadline,
            presence: true

  belongs_to :user
  belongs_to :book
  has_many :histories
end
