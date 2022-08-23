# frozen_string_literal: true

class Admin::LessonFormComponent < ViewComponent::Base
  include LessonsHelper

  def initialize lesson:
    super
    @lesson = lesson
  end
end
