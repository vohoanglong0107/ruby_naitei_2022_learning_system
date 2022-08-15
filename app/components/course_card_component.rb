# frozen_string_literal: true

class CourseCardComponent < ViewComponent::Base
  def initialize course:
    super
    @course = course
  end
end
