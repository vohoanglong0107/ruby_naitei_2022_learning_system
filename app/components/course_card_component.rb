# frozen_string_literal: true

class CourseCardComponent < ViewComponent::Base
  include SessionsHelper
  def initialize course:
    super
    @course = course
  end

  def link_to_course
    if current_user.admin?
      admin_course_path @course
    else
      course_path @course
    end
  end
end
