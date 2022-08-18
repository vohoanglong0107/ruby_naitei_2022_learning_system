# frozen_string_literal: true

class LessonNodeComponent < ViewComponent::Base
  def initialize lesson:, classes: ""
    super
    @lesson = lesson
    @classes = classes
    @id = "lesson-node-#{lesson.id}"
  end
end
