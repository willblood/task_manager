class SetDefaultNullFalseAndIndexUniqueTrueForUsers < ActiveRecord::Migration[7.1]
  def change
    #username formatter
    generate_from="user1A"
    User.where(username: nil).each do |user|
      generate_from= generate_from + "23"
      user.username= generate_from
    end
    change_column_null :users , :username, false
    add_index :users, :username, unique: true
    # end username formatter
    

    #password_formatter
    generate_from="pass"
    User.where(password_digest: nil).each do |user|
      generate_from= generate_from + "23"
      user.password= generate_from
    end
    change_column_null :users , :password_digest, false
    # end password formatter
  end
end
