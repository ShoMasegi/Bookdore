class Book < ApplicationRecord

  validates :title, presence: true
  validates :page,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :isbn_is_valid
  validate :same_book_already_exist

  has_one :card

  def isbn_is_valid
    if isbn.present? && !isbn.match?(/[0-9]{10}|[0-9]{13}/)
      errors.add(:isbn, ' : ISBN contains only number, and 10 or 13 length.')
    end
  end

  def same_book_already_exist
    if isbn.present?
      if Book.find_by(isbn: isbn)
        errors.add(:isbn, ' : The same isbn book is already exist.')
      end
    else
      if Book.find_by(title: title, authors: authors, page: page)
        errors.add(:title, ' : The same book is already exist.')
      end
    end
  end
end
