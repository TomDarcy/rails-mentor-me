# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Booking.destroy_all
Mentor.destroy_all
User.destroy_all

puts "Creating users..."
User.create(first_name: "Tom", last_name: "Darcy", mentor: true, email:"tom@gmail.com", password: "password")
User.create(first_name: "Anna", last_name: "Peysikova", mentor: true, email:"anna@gmail.com", password: "password")
User.create(first_name: "Aigerim", last_name: "Karataeva", mentor: true, email:"aigerim@gmail.com", password: "password")
puts "Creating mentors..."
Mentor.create(user_id: 6, bio: "I am a software engineer with 5 years of experience. I have worked in a variety of roles including software engineer, team lead, and project manager. I have worked on a variety of projects including web applications, mobile applications, and desktop applications. I have experience working with a variety of technologies including Ruby on Rails, React, React Native, and Java. I am passionate about helping others learn and grow. I am excited to help you learn and grow as a software engineer.", field: "Software Engineering", country: "United States", experience: "5 years", price_per_hour: 50)
Mentor.create(user_id: 7, bio: "I am a software engineer with 5 years of experience. I have worked in a variety of roles including software engineer, team lead, and project manager. I have worked on a variety of projects including web applications, mobile applications, and desktop applications. I have experience working with a variety of technologies including Ruby on Rails, React, React Native, and Java. I am passionate about helping others learn and grow. I am excited to help you learn and grow as a software engineer.", field: "Software Engineering", country: "United States", experience: "5 years", price_per_hour: 50)
Mentor.create(user_id: 8, bio: "I am a data science with 2 years of experience. I have worked in a variety of roles including statistics, data analytics. I have worked on a variety of projects including web applications, mobile applications, and desktop applications. I have experience working with a variety of technologies including Python, React, React Native, and Java. I am passionate about helping others learn and grow. I am excited to help you learn and grow as a data scientist.", field: "Data Science", country: "Italy", experience: "2 years", price_per_hour: 40)
puts "Creating bookings..."
Booking.create(user_id: 6, mentor_id: 3, start_time: "2021-03-01", end_time: "2021-03-02", description: "I want to learn how to code", status: "pending")
Booking.create(user_id: 6, mentor_id: 4, start_time: "2021-03-01", end_time: "2021-03-02", description: "I want to learn how to code", status: "pending")
Booking.create(user_id: 7, mentor_id: 2, start_time: "2021-03-01", end_time: "2021-03-02", description: "I want to learn how to code", status: "pending")
Booking.create(user_id: 7, mentor_id: 2, start_time: "2021-03-01", end_time: "2021-03-02", description: "I want to learn how to code", status: "pending")
puts "Creating reviews..."
Review.new(booking_id: 1, review: "Anna was a great mentor. He was very patient and explained things very clearly. I would definitely recommend him to anyone looking for a mentor.", rating: 5)
Review.new(booking_id: 2, review: "Aigerim was a great mentor. She was very patient and explained things very clearly. I would definitely recommend her to anyone looking for a mentor.", rating: 5)
Review.new(booking_id: 3, review: "Tom was a great mentor. She was very patient and explained things very clearly. I would definitely recommend her to anyone looking for a mentor.", rating: 5)
puts "Seeding done"
