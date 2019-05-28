class History < ApplicationRecord
  belongs_to :concrete_history, polymorphic: true
  belongs_to :card
end
