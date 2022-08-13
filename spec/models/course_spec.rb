require "rails_helper"

RSpec.describe Course, type: :model do
  describe "validations" do
    it do
      should validate_length_of(:name)
        .is_at_most(Settings.course.length.name_max_255)
    end

    it do
      should validate_length_of(:description)
        .is_at_most(Settings.course.length.max_1000)
    end
  end
end
