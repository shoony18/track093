class CreateCalenders < ActiveRecord::Migration[5.0]
  def change
    create_table :calenders do |t|
      t.integer :date_yy
      t.integer :date_mm
      t.integer :date_dd
      t.integer :day_of_the_weekend
      t.string :color

      t.timestamps
    end
  end
end
