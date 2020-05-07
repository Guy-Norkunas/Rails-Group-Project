p "Seeding"

User.create(
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

p 'users created 🙋‍♀️'

User.all.each do |user|
	user.images.create(
		url: "#{user.username}image"
	)
end

p 'images created 🎆'

User.all.each do |user|
  post = user.posts.create(
    content: Faker::Movies::StarWars.quote
  )
	user.posts.create(
    content: Faker::JapaneseMedia::OnePiece.quote
	)
  post.comments.create(
    user_id: user.id,
    post_id: post.id,
    comment: Faker::TvShows::DumbAndDumber.quote
  )
end

p 'posts and comments created 🥴💬'

Post.all.each do |post|
		post.tags.create(
			tag: Faker::Dessert.variety
		)
		post.tags.create(
			tag: Faker::Kpop.i_groups # 1990's og groups 
		)
end

p 'tags created 🏷'

p "complete"