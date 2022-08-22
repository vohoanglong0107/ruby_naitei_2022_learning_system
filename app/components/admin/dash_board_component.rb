# frozen_string_literal: true

class Admin::DashBoardComponent < ViewComponent::Base
  def initialize
    super
    @courses = Course.last Settings.course.num_demo_4
    @lessons = Lesson.all
  end
end
