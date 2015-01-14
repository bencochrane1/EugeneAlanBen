class RemoveCourseIdFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :course_id, :string
  end
end
