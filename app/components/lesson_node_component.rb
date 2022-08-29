# frozen_string_literal: true

class LessonNodeComponent < ViewComponent::Base
  include SessionsHelper
  def initialize lesson:, classes: ""
    super
    @lesson = lesson
    @classes = classes
  end
end
