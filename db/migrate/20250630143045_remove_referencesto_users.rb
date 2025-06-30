class RemoveReferencestoUsers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :users, :user, foreign_key: true, index: false
  end
end
