class CreateLives < ActiveRecord::Migration[5.0]
  def change
    create_table :lives do |t|
      t.integer :member_id
      t.integer :date_yy
      t.integer :date_mm
      t.integer :date_dd
      t.integer :sleep_time_lastnight
      t.integer :body_temp
      t.integer :body_height
      t.integer :body_weight
      t.string :body_feeling
      t.integer :injury

      t.timestamps
    end
  end
end
