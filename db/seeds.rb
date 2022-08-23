User.create!(name: "Example User",
             email: "example@railstutorial.org",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true)

User.create!(name: "Foobar",
             email: "foobar@gmail.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: false)

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

lessons = Lesson.all
10.times.each do |i|
  lessons.each do |lesson|
    lesson.words.create!(definition: "Word N#{i}",
                         translation: Faker::Lorem.sentence)
  end
end
