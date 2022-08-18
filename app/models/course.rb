class Course < ApplicationRecord
  validates :name, presence: true,
                   length: {maximum: Settings.course.length.name_max_255}
  validates :description, presence: true,
                          length: {
                            maximum: Settings.course.length.max_1000
                          }
  scope :recommended, ->{order(created_at: :desc)}
end
