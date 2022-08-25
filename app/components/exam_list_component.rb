# frozen_string_literal: true

class ExamListComponent < ViewComponent::Base
  def initialize exams:
    super
    @exams = exams
  end
end
