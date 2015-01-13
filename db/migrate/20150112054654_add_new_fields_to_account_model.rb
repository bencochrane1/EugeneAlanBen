class AddNewFieldsToAccountModel < ActiveRecord::Migration
  def change
  	add_column :accounts, :tagline, :string
  	add_column :accounts, :description, :string
  	add_column :accounts, :course_id, :integer
  end
end

    
