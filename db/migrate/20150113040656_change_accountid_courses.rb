class ChangeAccountidCourses < ActiveRecord::Migration
  def change
  	rename_column :projects, :account, :account_id
  end
end
