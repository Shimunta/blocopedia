10.times do
  User.create!(
  email: Faker::Internet.email,
  password: "password"
  )
end
  users = User.all

# create wiki's

20.times do
  Wiki.create!(
  user: users.sample,
  title: Faker::StarWars.character,
  body: Faker::Lorem.paragraph
  )
end

puts "Seeding Completed"
puts "#{User.count} users created"
puts "#{Wiki.count} items created"
