class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :date 
      t.integer :duration 
      t.integer :distance
      t.string :pace
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
