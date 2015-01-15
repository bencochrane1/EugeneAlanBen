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
    @lesson = current_project.lessons.create(lesson_params)
    if @lesson.save
      redirect_to project_lessons_path, notice: "Lesson created"
    else
      render :new
    end
  end

  def show
    @project = current_account.projects.find(params[:project_id])
    @lesson = @project.lessons.find(params[:id])
  end


    def edit
      @project = current_account.projects.find(params[:project_id])
      @lesson = @project.lessons.find(params[:id])    
    end

    def update
       @project = current_account.projects.find(params[:project_id])
       @lesson = @project.lessons.find(params[:id]) 
       
        if @lesson.update(lesson_params)
          # binding.pry
          # post_video_to_wistia(params["lesson"]["video"].tempfile)
          redirect_to project_lesson_path, notice: "Lesson updated"
        else 
          render :edit
        end
    end


  def post_video_to_wistia(path_to_video)
    
    uri = URI('https://upload.wistia.com/')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    # Construct the request.
    request = Net::HTTP::Post::Multipart.new uri.request_uri, {
      'api_password' => 'a241ff4ca1cd80caf3cfdd54ba65d11426153e1c515227baa9adc3d1bbce4899',
      # 'contact_id'   => '<CONTACT_ID>', # Optional.
      # 'project_id'   => '<PROJECT_ID>', # Optional.
      # 'name'         => '<MEDIA_NAME>', # Optional.

      'file' => UploadIO.new(
                  File.open(path_to_video),
                  'application/octet-stream',
                  File.basename(path_to_video)
                )
    }

    # Make it so!
    response = http.request(request)

    return response
  end


private

def lesson_params
  params.require(:lesson).permit(:name, :video, :description, :pdf, :project_id, :logo)
end

