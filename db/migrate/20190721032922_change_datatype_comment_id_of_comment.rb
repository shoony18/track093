class ChangeDatatypeCommentIdOfComment < ActiveRecord::Migration[5.0]
  def change
      change_column :comments, :comment_id, :integer
  end
end
