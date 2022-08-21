class Lesson < ApplicationRecord
  belongs_to :course
  validates :name, presence: true,
                   length: {maximum: Settings.lesson.length.name_max_255}
  validates :description, presence: true,
         length: {
           maximum: Settings.lesson.length.max_1000
         }
end
