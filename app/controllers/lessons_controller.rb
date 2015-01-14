class LessonsController < ApplicationController
  def index
    @projects = current_project.all
    @lessons = @projects.lesson.all
    redirect_to project_lesson_path(@project, lesson)
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
            redirect_to project_lessons_path, notice: "Lesson created"
        else
            render :new
        end
  end

    def show
      @project = current_account.projects.find(params[:id])
      @lesson = @project.lessons.find(params[:id])
    end

    def edit
      @project = current_account.projects.find(params[:id])
      @lesson = @project.lessons.find(params[:id])    
    end

    def update
       @project = current_account.projects.find(params[:id])
       @lesson = @project.lessons.find(params[:id]) 
       
        if @lesson.update(lesson_params)
            redirect_to project_lesson_path, notice: "Lesson updated"
        else 
            render :edit
        end
    end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :video, :description, :pdf, :project_id)
  end
end
