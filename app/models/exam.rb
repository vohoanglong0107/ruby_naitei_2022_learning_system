class Exam < ApplicationRecord
  PERMIT_ATTRIBUTES = [:lesson_id, :user_id,
                      {exam_questions_attributes: %i(id user_answer_id)}].freeze

  belongs_to :user
  belongs_to :lesson
  has_many :exam_questions, dependent: :destroy
  accepts_nested_attributes_for :exam_questions

  delegate :name, to: :lesson, prefix: true
  delegate :course_name, to: :lesson

  def score
    exam_questions.correctly_answered.count
  end

  def passed?
    score / exam_questions.length >= Settings.exam.min_passed_percentage_80
  end

  class << self
    def by_user_on_lesson user_id, lesson_id
      where(user_id: user_id, lesson_id: lesson_id)
    end
  end
end
