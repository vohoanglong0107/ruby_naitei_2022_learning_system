class AddLessonToWord < ActiveRecord::Migration[6.1]
  def change
    add_reference :words, :lesson, null: false, foreign_key: true
  end
end
