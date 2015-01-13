class AddSchoolLogoSchoolBackgroundToSchool < ActiveRecord::Migration
  def change
  	add_column :accounts, :school_logo_attachments, :string
  	add_column :accounts, :school_background_attachments, :string
  end
end
