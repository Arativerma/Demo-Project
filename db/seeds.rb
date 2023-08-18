# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# db/seeds.rb

Web Development_category = Category.create(name: "Web Development")
Mobile Development_category= Category.create(name: "Mobile Development")
Software Development_category = Category.create(name: "Software Development ")

Web Development_category.courses.create(title: "HTML")
Web Development_category.courses.create(title: "CSS")
Web Development_category.courses.create(title: "Javascript")

Mobile Development_category.courses.create(title: "Android")

Software Development_category.courses.create(title: "Java")
Software Development_category.courses.create(title: "Python")
