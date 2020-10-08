class CreateJournalsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :journals do |t|
      t.integer :user_id
      t.integer :water_intake
      t.string :notes
      t.string :mood
      t.integer :calories_in
      t.integer :calories_out
      t.integer :calorie_goal
      t.boolean :complete, default: false
      t.timestamps
  end
end
end
