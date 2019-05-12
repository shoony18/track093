class AddYoutubeToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :youtube, :string
  end
end
