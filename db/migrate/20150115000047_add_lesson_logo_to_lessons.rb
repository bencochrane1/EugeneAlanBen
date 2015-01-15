class AddLessonLogoToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :logo, :string
  end
end
