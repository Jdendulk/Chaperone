# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
require 'faker'

Message.destroy_all
FriendMeeting.destroy_all
Friend.destroy_all
Meeting.destroy_all
User.destroy_all

# Create Users
users = 5.times.map do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    password: "password#{i + 1}",
    first_name: "FirstName#{i + 1}",
    last_name: "LastName#{i + 1}",
    date_of_birth: "01-01-1990",
    mobile_number: "1234567890",
    address: "123 Main St",
    gender: ["Male", "Female", "Trans", "Gender Neutral", "Non-Binary", "Genderqueer", "Not Sure", "Rather not say"].sample,
    sexuality: ["Straight", "Gay", "Bisexual", "Asexual", "Queer", "Rather not say"].sample,
    admin: [true, false].sample
  )
end

# Create Meetings
meetings = 5.times.map do |i|
  Meeting.create!(
    user: users.sample,
    start_time: "08:00",
    end_time: "10:00",
    date: Date.today + i,
    who: "Who#{i+1}",
    what: "What#{i+1}",
    initial_meet_location: "Location#{i+1}",
    latitude: 51.5074 + i,
    longitude: -0.1278 + i,
    fake_call: Time.now + i.hours,
    how_did_it_go: "Good"
  )
end

# Create Friends
friends = 5.times.map do |i|
  Friend.create!(
    user_id: users[i].id,
    email: Faker::Internet.email
  )
end

# Create FriendsMeetings
friends_meetings = 5.times.map do |i|
  begin
    FriendMeeting.create!(
      friend: Friend.all.sample,
      meeting: Meeting.all.sample
    )
  rescue
    puts "skipped a creation of a friendmeeting because it was a duplicate"
  end
end

# Create Messages
5.times do |i|
  Message.create!(
    content: "Message content #{i + 1}",
    user: users.sample,
    meeting: meetings.sample
  )
end

puts "Seeding completed!"
