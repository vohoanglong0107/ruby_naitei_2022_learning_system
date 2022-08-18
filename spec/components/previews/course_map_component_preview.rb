class CourseMapComponentPreview < ViewComponent::Preview
  layout "signin"
  def with_default
    lessons = Lesson.first Settings.course.num_preview_lesson_13
    render(CourseMapComponent.new(lessons: lessons))
  end

  def with_completed
    lessons = Lesson.first Settings.course.num_preview_lesson_13

    lessons.each do |lesson|
      lesson.completed = true
    end

    render(CourseMapComponent.new(lessons: lessons))
  end
end
