class CreateLessonAccomplishments < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_accomplishments do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    remove_column :lessons, :completed
  end
end
