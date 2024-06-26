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
Location.destroy_all
Meeting.destroy_all
User.destroy_all

# first_names = ["John", "Josh", "Roel", "Louise", "Daniel"]

# Create Users
user = User.create!(
    email: "alex@gmail.com",
    password: "password1",
    first_name: "alex",
    date_of_birth: "01-01-1990",
    mobile_number: "1234567890",
    address: "123 Main St",
    gender: ["Male", "Female", "Trans", "Gender Neutral", "Non-Binary", "Genderqueer", "Not Sure", "Rather not say"].sample,
    sexuality: ["Straight", "Gay", "Bisexual", "Asexual", "Queer", "Rather not say"].sample,
    admin: [true, false].sample
  )

User.create!(
  first_name: "chaperone bot",
  email: "chaperone@chaperone.com",
  password: "password",
  admin: true
)

# Create Meetings
meetings = 5.times.map do |i|
  meeting = Meeting.create!(
    user: user,
    start_time: "08:00",
    end_time: "10:00",
    date: Date.today + i,
    who: "Who#{i + 1}",
    what: "What#{i + 1}",
    initial_meet_location: "Location#{i + 1}",
    fake_call: Time.now + i.hours,
    how_did_it_go: "Good",
    duration: 200
  )

  Location.create!(
    meeting: meeting,
    latitude: 51.5074 + i,
    longitude: -0.1278 + i
  )

  meeting
end

# Create Friends
image_urls = [
  "https://kitt.lewagon.com/placeholder/users/arthur-littm",
  "https://kitt.lewagon.com/placeholder/users/sarahlafer",
  "https://kitt.lewagon.com/placeholder/users/krokrob",
  "https://kitt.lewagon.com/placeholder/users/cveneziani",
  "https://vuesax.com/avatars/avatar-3.png"
]

friend_names = ["dan", "sarah", "rob", "cveziani", "avatar"]

friends = image_urls.each_with_index do |url, i|
  Friend.create!(
    user: user,
    email: Faker::Internet.email,
    image_url: url,
    phone: "07912611841",
    name: friend_names[i]
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
    user: user,
    meeting: meetings.sample
  )
end

puts "Seeding completed!"
