# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Admin User', email: 'admin@example.com', password: 'admin', password_confirmation: 'admin', admin: true)
User.create(name: 'Normal User', email: 'normal@example.com', password: 'normal', password_confirmation: 'normal', admin: false)

# 30.times do |no|
#   User.create(
#       name: "#{no}Sample User",
#       email: "#{no}sample@example.com",
#       password: "example#{no}",
#       password_confirmation: "example#{no}",
#       admin: false
#   )
# end