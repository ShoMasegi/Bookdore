class History < ApplicationRecord
  belongs_to :concrete_history, polymorphic: true
end
