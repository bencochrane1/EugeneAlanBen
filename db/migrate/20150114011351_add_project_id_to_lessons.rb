class AddProjectIdToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :project_id, :integer
  end
end
