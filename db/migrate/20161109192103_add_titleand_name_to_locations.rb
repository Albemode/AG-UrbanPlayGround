class AddTitleandNameToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :title, :string
    add_column :locations, :name, :string
  end
end
