class Lesson < ApplicationRecord
  belongs_to :course
  has_many :words, dependent: :destroy

  UPDATEDB_ATTRS = [:name, :description, {
    words_attributes: %i(id definition translation)
  }].freeze

  accepts_nested_attributes_for :words, allow_destroy: true,
                                          reject_if: :reject_word

  validates :name, presence: true,
                   length: {maximum: Settings.lesson.length.name_max_255}
  validates :description, presence: true,
         length: {
           maximum: Settings.lesson.length.max_1000
         }

  delegate :name, to: :course, prefix: true

  private
  def reject_word word_attrs
    word_attrs[:definition].blank?
  end
end
