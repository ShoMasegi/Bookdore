FactoryBot.define do
  factory :book do
    isbn { '0123456789' }
    title { 'Sample Book Title' }
    publisher { 'Sample Publisher' }
    authors { %w(sample_1 sample_2) }
    description { 'Sample description' }
    category { 'Main Category' }
    page { 3000 }
    thumbnail { 'https://mocks/images/sample.png' }
  end
end
