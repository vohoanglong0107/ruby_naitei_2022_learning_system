class LessonNodeComponentPreview < ViewComponent::Preview
  layout "signin"
  def with_completed
    lesson = Lesson.new completed: true
    render(LessonNodeComponent.new(lesson: lesson))
  end

  def with_incompleted
    lesson = Lesson.new completed: false
    render(LessonNodeComponent.new(lesson: lesson))
  end
end
