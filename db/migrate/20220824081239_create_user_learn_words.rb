class CreateUserLearnWords < ActiveRecord::Migration[6.1]
  def change
    create_table :user_learn_words do |t|
      t.references :word, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
