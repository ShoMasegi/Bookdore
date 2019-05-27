FactoryBot.define do
  factory :card do
    deadline { '2019-10-20 20:00:00.000000' }
    status { 2 }
    association :user
    association :book
    spent_time_sec { 600000 }
    current_page { 230 }
  end
end
