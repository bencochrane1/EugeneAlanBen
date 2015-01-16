
require 'net/http'
# require 'net/http/post/multipart'

class LessonsController < ApplicationController

  def index
    @project = current_account.projects.find(params[:project_id])
    @lessons = @project.lessons.all
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
    # binding.pry  
    @lesson = @project.lessons.create(lesson_params)
    if @lesson.valid?
      
      @lesson.wistia_video = post_video_to_wistia(params["lesson"]["video"].tempfile)
      @lesson.save
      binding.pry
      
      redirect_to project_lesson_path(@project, @lesson), notice: "Lesson created"
    else
      render :new
    end
  end

  def show
    @project = current_account.projects.find(params[:project_id])
    @lesson = @project.lessons.find(params[:id])
    # @lessons = @project.lessons.all
    
    @video = Wistia::Media.find(@lesson.wistia_video).attributes["embedCode"]
      # binding.pry
  end

  def edit
    @project = current_account.projects.find(params[:project_id])
    @lesson = @project.lessons.find(params[:id])    
  end

  def update
     @project = current_account.projects.find(params[:project_id])
     @lesson = @project.lessons.find(params[:id]) 
     
    if @lesson.update(lesson_params)
      @lesson.wistia_video = post_video_to_wistia(params["lesson"]["video"].tempfile)
      @lesson.save
      
      redirect_to project_lesson_path, notice: "Lesson updated"
    else
      render :edit
    end


    # if @lesson.update(lesson_params)
    #   redirect_to project_lesson_path, notice: "Lesson updated"
    # else 
    #   render :edit
    # end

  end

  def destroy
    @project = current_account.projects.find(params[:project_id])
    @lesson = @project.lessons.find(params[:id])
    @lesson.destroy
    redirect_to project_path(@project), notice: "Lesson deleted"
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

  def post_video_to_wistia(video_file)

    # binding.pry
    conn = Faraday.new(:url => 'https://upload.wistia.com/') do |conn|
      conn.request :multipart
      conn.request :url_encoded
      conn.adapter :net_http
    end

    response = conn.post '/', {
      api_password: ENV['WISTIA_API_PASSWORD'],
      file: Faraday::UploadIO.new(video_file.path, 'application/octet-stream')
    }

    return JSON.parse(response.body)["hashed_id"]
  end

  private

    def lesson_params
      params.require(:lesson).permit(:name, :wistia_video, :description, :pdf, :project_id, :logo)
    end

end
