# frozen_string_literal: true

class Admin::CourseComponent < ViewComponent::Base
  def initialize courses:, pagy:
    super
    @courses = courses
    @pagy = pagy
  end
end
