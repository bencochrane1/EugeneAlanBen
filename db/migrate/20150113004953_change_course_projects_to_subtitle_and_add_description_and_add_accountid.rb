class ChangeCourseProjectsToSubtitleAndAddDescriptionAndAddAccountid < ActiveRecord::Migration
  def change
		rename_column :projects, :client, :subtitle
		add_column :projects, :description, :text
		add_column :projects, :account, :integer
  end
end
