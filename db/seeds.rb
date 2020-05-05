p "Seeding"
# user = User.create(
#   username: "admin",
#   email: "admin@admin.com",
#   password: "password123",
#   password_confirmation: "password123",
#   status: 69
# )

10.times do 
  user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password123",
    password_confirmation: "password123"
  )
  user.save!
end
  p 'users created 🙋‍♀️'

10.times do 
  Tag.create(
    tag: Faker::Dessert.variety
  )
end
  p 'tags created 🏷'

5.times do |i|
  Image.create(
    location: "app/assets/images/#{i}seed.jpeg",
    user_id: i
  )
end
  p 'images created 🎆'

# User.all.each do |user| 
#   user.post.create(
#     content: Faker::JapaneseMedia::OnePiece.quote
#   )
# end