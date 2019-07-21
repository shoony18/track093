class ChangeDatatypeArticleIdOfComments < ActiveRecord::Migration[5.0]
  def change
      change_column :comments, :article_id, :integer
  end
end
