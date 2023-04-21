class ChangeNameToColumnCommentCount < ActiveRecord::Migration[7.0]
  def change
    rename_column :photos, :comment_count, :comments_count
  end
end
