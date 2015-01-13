class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :video
      t.text :description
      t.string :pdf
      t.integer :teacher_id
      t.integer :course_id

      t.timestamps
    end
  end
end
