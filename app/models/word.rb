class Word < ApplicationRecord
  validates :definition, :translation, presence: true,
  length: {maximum: Settings.word.max_length_255}

  scope :latest_word, ->{order(create_at: :desc)}
end
