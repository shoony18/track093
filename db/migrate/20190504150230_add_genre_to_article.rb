class AddGenreToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :genre, :string
  end
end
