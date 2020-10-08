class CreateGoalsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name
      t.string :description
      t.string :length
      t.string :reward
      t.boolean :complete, default: false
      t.timestamps
    end
  end
end
