class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.string :definition
      t.string :translation

      t.timestamps
    end
  end
end
