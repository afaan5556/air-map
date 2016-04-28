5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_name: Faker::Internet.user_name, email: Faker::Internet.email, password: "password")
end

10.times do
  Auction.create(user_id: (rand(5)+1), name: Faker::Book.title, description: Faker::Lorem.sentence, start: Faker::Time.between(DateTime.now - 1, DateTime.now + 40), stop: Faker::Time.between(DateTime.now + 45, DateTime.now + 90), price: Faker::Number.decimal(2))
end

50.times do
  Bid.create(user_id: (rand(5)+1), auction_id: (rand(10)+1), amount: rand(100))
end
