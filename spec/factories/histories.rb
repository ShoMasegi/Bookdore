FactoryBot.define do
  factory :history do
    created_at { '2019-10-20 20:00:00.000000' }
    updated_at { '2019-10-25 20:00:00.000000' }
    association :card
    association :concrete_history, factory: :read_history
  end
end
