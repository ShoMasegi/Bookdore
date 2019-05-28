class RegisterHistory < ApplicationRecord
  has_one :histories, as: :concrete_history
end
