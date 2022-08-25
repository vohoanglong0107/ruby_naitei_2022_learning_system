# frozen_string_literal: true

class Admin::ExamsListComponent < ViewComponent::Base
  def initialize exams:
    super
    @exams = exams
  end
end
