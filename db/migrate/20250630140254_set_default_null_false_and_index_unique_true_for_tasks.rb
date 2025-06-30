class SetDefaultNullFalseAndIndexUniqueTrueForTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks , :title, false
    change_column_null :tasks , :description, false
    add_index :tasks, :title, unique: true
    add_reference :users, :user, foreign_key: true
  end
end
