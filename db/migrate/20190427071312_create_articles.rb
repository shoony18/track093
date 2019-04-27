class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :titleimg
      t.string :lead
      t.string :topic1
      t.string :content1
      t.string :img1
      t.string :topic2
      t.string :content2
      t.string :img2
      t.string :topic3
      t.string :content3
      t.string :img3

      t.timestamps
    end
  end
end
