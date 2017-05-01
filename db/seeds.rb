require 'random_data'

# 50.times do
#  wiki = Wiki.create!(
#     title:  RandomData.random_sentence,
#     body:   RandomData.random_paragraph
#   )
#   wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)

 10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
 end
 
#  users = User.all
 
 25.times do
  Wiki.create!(
    title:  Faker::HarryPotter.character,
    body:   Faker::HarryPotter.quote,
    user: User.all.sample
  )
 end 
 
 User.create!(
    email: 'admin@gmail.com',
    password: 'helloworld',
    role: 'admin'
)

User.create!(
    email: 'premium@gmail.com',
    password: 'helloworld',
    role: 'premium'
)

User.create!(
    email: 'standard@gmail.com',
    password: 'helloworld',
    role: 'standard'
)
 
puts "seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"