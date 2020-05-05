user = User.new(
  username: "admin",
  email: "admin@admin.com",
  password: "password123",
  password_confirmation: "password123",
  status: 69
)

user.save!

10.times do 
  user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password123",
    password_confirmation: "password123"
  )
  user.save!
end

10.times do 
  tag = Tag.create(
    tag: Faker::Dessert.variety,
  )
end

User.all.each do |user| 
    user.post.create(
        content: Faker::JapaneseMedia::OnePiece.quote
    )
end