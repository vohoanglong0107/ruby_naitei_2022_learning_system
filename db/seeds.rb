User.create!(name: "Example User",
             email: "example@railstutorial.org",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true)

20.times.each do |i|
  Course.create!(name: "Course N#{i}",
                 description: Faker::Lorem.sentence,
                 order: i)
end
