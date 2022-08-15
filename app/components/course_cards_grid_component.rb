# frozen_string_literal: true

class CourseCardsGridComponent < ViewComponent::Base
  def initialize courses:
    super
    @courses = courses
  end
end
