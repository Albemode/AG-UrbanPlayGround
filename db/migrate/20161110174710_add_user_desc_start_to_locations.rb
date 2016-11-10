class AddUserDescStartToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :user_id, :integer
    add_column :locations, :description, :text
    add_column :locations, :start_at, :datetime
  end
end
