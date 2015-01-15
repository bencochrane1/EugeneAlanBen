
require 'net/http'
# require 'net/http/post/multipart'

class LessonsController < ApplicationController

  def index
    @projects = current_account.projects.find(params[:project_id])
    @lessons = @projects.lessons.all
    redirect_to project_lesson_path(@lessons, @project)
  end

  def new
    # binding.pry
    # @project = Project.find(params[current_project])
    @project = current_project
    @lesson = current_project.lessons.build
  end

  def create 
    @project = current_account.projects.find(params[:project_id])    
    @lesson = current_project.lessons.create(lesson_params)
    if @lesson.save
      redirect_to project_lesson_path(@project, @lesson), notice: "Lesson created"
    else
      render :new
    end
  end

  def show
    @project = current_account.projects.find(params[:project_id])
    @lesson = @project.lessons.find(params[:id])
      # @video = Wistia::Media.find(:all).elements[0].attributes[:hashed_id]
  end

  def edit
    @project = current_account.projects.find(params[:project_id])
    @lesson = @project.lessons.find(params[:id])    
  end

  def update
     @project = current_account.projects.find(params[:project_id])
     @lesson = @project.lessons.find(params[:id]) 
     
      if @lesson.update(lesson_params)
        redirect_to project_lesson_path, notice: "Lesson updated"
      else 
        render :edit
      end
  end

  def destroy
    @project = current_account.projects.find(params[:project_id])
    @lesson = @project.lessons.find(params[:id])
    @lesson.destroy
    redirect_to project_lessons_path, notice: "Lesson deleted"
  end

  def update
   @project = current_account.projects.find(params[:project_id])
   @lesson = @project.lessons.find(params[:id])
   if @lesson.update(lesson_params)
        redirect_to project_lesson_path, notice: "Lesson updated"
      else
        render :edit
      end
  end

  def post_video_to_wistia(path_to_video)

    conn = Faraday.new(:url => 'https://upload.wistia.com/') do |conn|
      conn.request :multipart
      conn.request :url_encoded
      conn.adapter :net_http
      conn.on_success
    end

    conn.post '/', {
      api_password: WISTIA_API_PASSWORD,
      file: Faraday::UploadIO.new(path_to_video.path, 'application/octet-stream')
    }

  end

  private

    def lesson_params
      params.require(:lesson).permit(:name, :video, :description, :pdf, :project_id, :logo)
    end

end
