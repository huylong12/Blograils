# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar")
# end

# users = User.order(:created_at).take(6)
# 11.times do
#   name = Faker::Lorem.sentence(5)
#   users.each { |user| user.testsuite.create!(name: name) }
# end
User.create!(name:  "long", email: "long1234@gmail.com",
  password: "123456", password_confirmation: "123456")
10.times do
  name = Faker::Name.name
  email = Faker::Lorem.sentence

  User.create(name: name)

  users = User.take(3)

  3.times do
    name = Faker::Lorem.sentence
    users.each do |user|
      user.testsuites.create(name: name)
    end
  end
end