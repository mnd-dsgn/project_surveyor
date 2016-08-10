class AddColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :multiple_answers, :boolean, :default => false
    add_column :questions, :num_answers, :integer
  end
end
