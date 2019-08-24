class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.integer :member_id
      t.string :daymenu_title
      t.string :daymenu_content
      t.integer :date_yy
      t.integer :date_mm
      t.integer :date_dd
      t.string :genre
      t.string :stress
      t.string :plan_comment
      t.integer :done
      t.string :evaluation
      t.string :after_comment

      t.timestamps
    end
  end
end
