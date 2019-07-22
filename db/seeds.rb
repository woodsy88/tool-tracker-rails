puts "Starting to run seeds file..."

50.times do |topic|
  Topic.create!(title: "Topic #{topic}")
end

puts "50 Topics created"

User.create!(
  email: "user1@test.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  first_name: "Jon",
  last_name: "Snow",
  username: "wallwatcher",
)

User.create!(
  email: "user2@test.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  first_name: "Jon",
  last_name: "Snow",
  username: "youngwallwatcher",
)

puts "2 users were created"

AdminUser.create!(
  email: "admin@test.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  first_name: "Jon",
  last_name: "Snow",
  username: "admin"
)

puts "Admin user created"

50.times do |tool|
  Tool.create!(
    title: "tool #{tool}",
    description: "Some amazing content here",
    topic_id: Topic.last.id,
    user_id: User.last.id
  )
end

puts "50 tools were created"