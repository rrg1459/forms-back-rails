class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.references :survey, null: false, foreign_key: true
      t.string :content
      t.integer :question_type, default: 0, null: false
      t.boolean :mandatory, default: false, null: false

      t.timestamps
    end
  end
end
