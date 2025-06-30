class SetDefaultNullFalseAndIndexUniqueTrueForTasks < ActiveRecord::Migration[7.1]
  def change
    #title formatter
    generate_from="MessiA"
      Task.where(title: nil).each do |task|
      generate_from= generate_from + "23"
      task.title = generate_from
      task.save
    end
    change_column_null :tasks , :title, false   
    add_index :tasks, :title, unique: true
    # end title formatter
    

    #description formatter
    generate_from="Demain je vais"
    Task.where(description: nil).each do |task|
      generate_from= generate_from + "23"
      task.description= generate_from
      task.save
    end
    change_column_null :tasks , :description, false
    # end description formatter

    #Delete Task with user_id nill
    Task.where(user_id:nil).each { |task|  task.destroy  }
    change_column_null :tasks , :user_id, false

  end
end
