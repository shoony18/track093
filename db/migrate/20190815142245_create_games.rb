class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :member_id
      t.string :content
      t.string :program
      t.integer :date_yy
      t.integer :date_mm
      t.integer :date_dd
      t.integer :target
      t.string :plan_comment
      t.integer :result
      t.string :evaluation
      t.string :after_comment

      t.timestamps
    end
  end
end
