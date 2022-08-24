class ExamAnswer < ApplicationRecord
  belongs_to :word
  belongs_to :exam_question
  delegate :translation, to: :word
end
