class CreateKids < ActiveRecord::Migration[5.0]
  def change
    create_table :kids do |t|
      t.string :name
      t.integer :age
      t.string :gender, :limit => 1
      t.text :hobbies
      t.integer :user_id


      t.timestamps
    end
  end
end
