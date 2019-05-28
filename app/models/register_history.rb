class RegisterHistory < ApplicationRecord
  has_one :histories, as: :concrete_history

  # validates :from, inclusion: { in: Card.statuses.keys }
  # validates :to, inclusion: { in: Card.statuses.keys }
end
