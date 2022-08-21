# frozen_string_literal: true

class Admin::LessonsListComponent < ViewComponent::Base
  def initialize lessons:
    super
    @lessons = lessons
  end
end
