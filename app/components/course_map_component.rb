# frozen_string_literal: true

class CourseMapComponent < ViewComponent::Base
  def initialize lessons:
    super
    @lessons = lessons
  end
end
