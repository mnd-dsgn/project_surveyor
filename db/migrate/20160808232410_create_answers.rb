class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :text
      t.integer :question_id, null: false

      t.timestamps null: false
    end
  end
end
