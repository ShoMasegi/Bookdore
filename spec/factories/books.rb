FactoryBot.define do
  factory :book do
    isbn { "MyString" }
    title { "MyString" }
    publisher { "MyString" }
    authors { "MyString" }
    description { "MyText" }
    category { "MyString" }
    thumbnail { "MyString" }
    page { 1 }
  end
end
