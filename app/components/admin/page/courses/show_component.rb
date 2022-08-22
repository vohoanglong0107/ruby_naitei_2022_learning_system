# frozen_string_literal: true

class Admin::Page::Courses::ShowComponent < ViewComponent::Base
  def initialize course:
    super
    @course = course
  end
end
