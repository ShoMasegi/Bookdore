class Card < ApplicationRecord
  enum status: [:want, :bought, :reading, :read]

  validates :deadline, presence: true
  # validates :status, inclusion: { in: Card.statuses.keys }
  validate :book_page_include_current_page

  belongs_to :user
  validates :user, presence: true
  belongs_to :book
  validates :book, presence: true

  has_many :histories
  validates_associated :histories

  def book_page_include_current_page
    unless (0..book&.page || 0).include? current_page
      errors.add(:current_page, ' : card.current_page should be less than book.page.')
    end
  end

end
