# frozen_string_literal: true

require "rails_helper"

RSpec.describe CourseCardsGridComponent, type: :component do
  let(:courses){build_list(:course, 3, :n5)}
  subject{render_inline described_class.new(courses: courses)}
  it{should have_css "div.course-card", count: 3}
end
