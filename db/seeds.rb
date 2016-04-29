3.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_name: Faker::Internet.user_name, email: Faker::Internet.email, password: "password")
end

12.times do
  Airmap.create(user_id: (rand(3)+1))
end
