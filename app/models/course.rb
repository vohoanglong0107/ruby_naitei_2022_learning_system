class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy
  accepts_nested_attributes_for :lessons, allow_destroy: true,
                                          reject_if: :reject_lesson
  validates :name, presence: true,
                   length: {maximum: Settings.course.length.name_max_255}
  validates :description, presence: true,
                          length: {
                            maximum: Settings.course.length.max_1000
                          }
  scope :recommended, ->{order(created_at: :desc)}

  private
  def reject_lesson lesson_attrs
    lesson_attrs[:name].blank?
  end
end
