# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_user = User.create(name: 'Admin User',
                         email: 'admin@example.com',
                         password: 'admin',
                         password_confirmation: 'admin',
                         admin: true)
normal_user = User.create(name: 'Normal User',
                          email: 'normal@example.com',
                          password: 'normal',
                          password_confirmation: 'normal',
                          admin: false)
book1 = Book.create(isbn: 'sample1_isbn',
                    title: 'sample1_title',
                    publisher: 'sample1_publisher',
                    authors: ['sample1_author', 'sample1_author2'],
                    description: 'sample1_description',
                    category: 'sample1_category1',
                    thumbnail: 'sample1_thumbnail',
                    page: 123)
book2 = Book.create(isbn: 'sample2_isbn',
                    title: 'sample2_title',
                    publisher: 'sample2_publisher',
                    authors: ['sample2_author', 'sample2_author2'],
                    description: 'sample2_description',
                    category: 'sample2_category1',
                    thumbnail: 'sample2_thumbnail',
                    page: 123)

card1 = Card.create(deadline: '2019-10-10 10:00:00.000000',
                    status: 1,
                    user_id: admin_user.id,
                    book_id: book1.id,
                    spent_time_sec: 60000,
                    current_page: 230)
card2 = Card.create(deadline: '2019-10-20 20:00:00.000000',
                    status: 2,
                    user_id: normal_user.id,
                    book_id: book2.id,
                    spent_time_sec: 60000,
                    current_page: 230)

read_history1 = ReadHistory.create(page_count: 20, time_sec: 30000)
read_history2 = ReadHistory.create(page_count: 40, time_sec: 60000)
register_history1 = RegisterHistory.create(from: 2, to: 3)
register_history2 = RegisterHistory.create(from: 1, to: 3)

history1 = History.create(concrete_history: read_history1,
                          card_id: card1.id,
                          user_id: admin_user.id,
                          book_id: book1.id)

history2 = History.create(concrete_history: read_history2,
                          card_id: card1.id,
                          user_id: admin_user.id,
                          book_id: book1.id)

history3 = History.create(concrete_history: register_history1,
                          card_id: card1.id,
                          user_id: admin_user.id,
                          book_id: book1.id)

history4 = History.create(concrete_history: register_history2,
                          card_id: card2.id,
                          user_id: normal_user.id,
                          book_id: book2.id)

[card1, card2].each do |card|
  puts card.book.title
  card.histories.each do |concrete_history|
    puts concrete_history
  end
end
