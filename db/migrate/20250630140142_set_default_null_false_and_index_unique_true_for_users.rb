class SetDefaultNullFalseAndIndexUniqueTrueForUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users , :username, false
    change_column_null :users , :password_digest, false
    add_index :users, :username, unique: true
  end
end
