FactoryBot.define do
  factory :user do
    name { "sample_name" }
    email { "sample_email" }
    password_digest { "sample_password" }
    admin { false }
  end
end
