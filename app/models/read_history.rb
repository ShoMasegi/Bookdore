class ReadHistory < ApplicationRecord
  has_one :histories, as: :concrete_history
end
