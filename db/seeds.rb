p "Seeding 💦🐶"
user = User.create(
  username: "admin",
  email: "admin@admin.com",
  password: "password123",
  password_confirmation: "password123",
  status: 69
)

10.times do 
  user = User.create(
    username: Faker::JapaneseMedia::SwordArtOnline.game_name,
    email: Faker::Internet.email,
    password: "password123",
    password_confirmation: "password123"
  )
end

sleep(0.5)
p 'users created 🙋‍♀️'

User.all.each do |user|
	user.images.create(
		url: "test"
	)
end

sleep(0.5)
p 'images created 🎆'

User.all.each do |user|
	i = 1
  user.posts.create(
    content: Faker::Movies::StarWars.quote
  )
	i += 1
	user.posts.create(
    content: Faker::JapaneseMedia::OnePiece.quote
	)
	i += 1
end

sleep(0.5)
p 'posts created 🥴'

Post.all.each do |post|
	2.times do 
		post.tags.create(
			tag: Faker::Dessert.variety
		)
	end
end

sleep(0.5)
p 'tags created 🏷'


sleep(0.5)
p "complete"