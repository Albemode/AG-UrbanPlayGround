class RemovefnameAndlnameFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :fname
    remove_column :users, :lname
  end
end
