class ChangeNameToColumnPhotoCount < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :photo_count, :photos_count
  end
end
