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

courses = Course.all
10.times.each do |i|
  courses.each do |course|
    course.lessons.create!(name: "Lesson N#{i}",
                           description: Faker::Lorem.sentence,
                           order: i)
  end
end
