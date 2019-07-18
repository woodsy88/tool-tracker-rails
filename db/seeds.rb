puts "Starting to run seeds file..."

50.times do |topic|
  Topic.create!(title: "Topic #{topic}")
end

puts "50 Topics created"




User.create!(
  email: "admin@test.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  first_name: "Jon",
  last_name: "Snow",
  username: "wallwatcher",
  role: "admin"
)

puts "Admin user created"

User.create!(
  email: "student@test.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  first_name: "Jon",
  last_name: "Snow",
  username: "youngwallwatcher",
  role: "student"
)

puts "Student user created"



50.times do |tool|
  Tool.create!(
    title: "tool #{tool}",
    description: "Some amazing content here",
    topic_id: Topic.last.id,
    user_id: User.last.id
  )
end

puts "50 tools were created"