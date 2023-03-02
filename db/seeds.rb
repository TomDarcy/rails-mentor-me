# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
Booking.destroy_all
Mentor.destroy_all
User.destroy_all

tom = User.new(first_name: "Tom", last_name: "Darcy", mentor: true, email:"tom@gmail.com", password: "password")
file = URI.open("https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60")
tom.photo.attach(io: file, filename: 'tom.png', content_type: 'image/png')
tom.save
anna = User.new(first_name: "Anna", last_name: "Peysikova", mentor: true, email:"anna@gmail.com", password: "password")
file = URI.open("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60")
anna.photo.attach(io: file, filename: 'anna.png', content_type: 'image/png')
anna.save
aig = User.new(first_name: "Aigerim", last_name: "Karataeva", mentor: true, email:"aigerim@gmail.com", password: "password")
file = URI.open("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60")
aig.photo.attach(io: file, filename: 'aig.png', content_type: 'image/png')
aig.save
Mentor.create(user_id: User.first.id, bio: "I am a software engineer with 5 years of experience. I have worked in a variety of roles including software engineer, team lead, and project manager. I have worked on a variety of projects including web applications, mobile applications, and desktop applications. I have experience working with a variety of technologies including Ruby on Rails, React, React Native, and Java. I am passionate about helping others learn and grow. I am excited to help you learn and grow as a software engineer.", field: "Software Engineering", country: "United States", experience: "5 years", price_per_hour: 50)
Mentor.create(user_id: User.second.id, bio: "I am a software engineer with 5 years of experience. I have worked in a variety of roles including software engineer, team lead, and project manager. I have worked on a variety of projects including web applications, mobile applications, and desktop applications. I have experience working with a variety of technologies including Ruby on Rails, React, React Native, and Java. I am passionate about helping others learn and grow. I am excited to help you learn and grow as a software engineer.", field: "Software Engineering", country: "United States", experience: "5 years", price_per_hour: 50)
Mentor.create(user_id: User.third.id, bio: "I am a data science with 2 years of experience. I have worked in a variety of roles including statistics, data analytics. I have worked on a variety of projects including web applications, mobile applications, and desktop applications. I have experience working with a variety of technologies including Python, React, React Native, and Java. I am passionate about helping others learn and grow. I am excited to help you learn and grow as a data scientist.", field: "Data Science", country: "Italy", experience: "2 years", price_per_hour: 40)
Booking.create(user_id:  User.first.id, mentor_id: Mentor.second.id, start_time: "2021-03-01", end_time: "2021-03-02", description: "I want to learn how to code", status: "pending")
Booking.create(user_id:  User.first.id, mentor_id: Mentor.third.id, start_time: "2021-03-01", end_time: "2021-03-02", description: "I want to learn how to code", status: "pending")
Booking.create(user_id:  User.second.id, mentor_id: Mentor.first.id, start_time: "2021-03-01", end_time: "2021-03-02", description: "I want to learn how to code", status: "pending")
Booking.create(user_id:  User.second.id, mentor_id: Mentor.third.id, start_time: "2021-03-01", end_time: "2021-03-02", description: "I want to learn how to code", status: "pending")
Review.new(booking_id: Booking.first.id, review: "Anna was a great mentor. He was very patient and explained things very clearly. I would definitely recommend him to anyone looking for a mentor.", rating: 5)
Review.new(booking_id: Booking.second.id, review: "Aigerim was a great mentor. She was very patient and explained things very clearly. I would definitely recommend her to anyone looking for a mentor.", rating: 5)
Review.new(booking_id: Booking.third.id, review: "Tom was a great mentor. She was very patient and explained things very clearly. I would definitely recommend her to anyone looking for a mentor.", rating: 5)
puts "done"
