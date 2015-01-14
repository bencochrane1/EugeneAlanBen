class LessonsController < ApplicationController
  def index
    @lessons = current_account.lessons.all
  end

  def new
    # binding.pry
    # @project = Project.find(params[current_project])
    @project = current_project
    @lesson = current_project.lessons.build
  end

  def create 
    @lesson = current_project.lessons.create(lesson_params)
    if @lesson.save
            redirect_to root_path, notice: "Lesson created"
        else
            render :new
        end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :video, :description, :pdf, :project_id)
  end
end
