# frozen_string_literal: true

class Admin::DashBoardComponent < ViewComponent::Base
  def initialize
    super
    @courses = Course.first Settings.course.num_demo_4
  end
end
