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

