class History < ApplicationRecord

  belongs_to :concrete_history, polymorphic: true

  belongs_to :card
  validates :card, presence: true
  validate :read_history_validates

  def read_history_validates
    if concrete_history.kind_of? ReadHistory
      if concrete_history.page_count >= card.book.page
        errors.add(:concrete_history, ' : read_history.page_count should be less than book.page.')
      end
    end
  end
end
