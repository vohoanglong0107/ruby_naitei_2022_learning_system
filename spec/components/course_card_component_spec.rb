# frozen_string_literal: true

require "rails_helper"

RSpec.describe CourseCardComponent, type: :component do
  let(:course){build(:course, :n5)}
  subject{render_inline described_class.new(course: course)}

  it{should have_text course.name}
  it{should have_text course.description}
end
