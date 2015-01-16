class ChangeNameOfVideoColumn < ActiveRecord::Migration
  def change
    rename_column :lessons, :video, :wistia_video
  end
end
