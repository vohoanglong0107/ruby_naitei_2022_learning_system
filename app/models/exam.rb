class Exam < ApplicationRecord
  PERMIT_ATTRIBUTES = [:lesson_id, :user_id,
                      {exam_questions_attributes: %i(id user_answer_id)}].freeze

  belongs_to :user
  belongs_to :lesson
  has_many :exam_questions, dependent: :destroy
  accepts_nested_attributes_for :exam_questions

  delegate :name, to: :lesson, prefix: true
  delegate :course_name, to: :lesson
end
