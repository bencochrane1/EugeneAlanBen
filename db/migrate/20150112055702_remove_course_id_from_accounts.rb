class RemoveCourseIdFromAccounts < ActiveRecord::Migration
  def change
  	remove_column :accounts, :course_id
  end
end
