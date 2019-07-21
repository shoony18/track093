class ChangeDatatypeCommentIdOfComment < ActiveRecord::Migration[5.0]
    def up
        if Rails.env.development? || Rails.env.test?
            change_column :comments, :comment_id, :integer    
        else Rails.env.production?
      # 本番環境はusingオプションを追加
            change_column :comments, :comment_id, 'integer USING CAST(comment_id AS integer)'
        end
    end
       
    def down
        change_column :comments, :comment_id, :string
    end
end
