user = User.new(
    email: "admin@admin.com",
    password: "password123",
    password_confirmation: "password123",
)

user.save!

10.times do 
    user = User.new(
        email: Faker::Internet.email,
        password: "password123",
        password_confirmation: "password123"
    )
    user.save!
end

