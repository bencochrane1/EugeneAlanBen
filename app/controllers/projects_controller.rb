class ProjectsController < ApplicationController
    def index
        @projects = current_account.projects.all
    end

    def show
        @project = current_account.projects.find(params[:id])
    end

    def new
        @project = current_account.projects.new
    end

    def create
        @project = current_account.projects.build(project_params)
        if @project.save
            redirect_to root_path, notice: "Project created"
        else
            render :new
        end
    end

    def edit
        @project = current_account.projects.find(params[:id])
    end

    def update
       @project = current_account.projects.find(params[:id])
       
        if @project.update(project_params)
            redirect_to root_path, notice: "Project updated"
        else 
            render :edit
        end
    end

    def destroy
        @project.destroy
        redirect_to projects_path
    end

    private

    def project_params
        params.require(:project).permit(:name, :subtitle, :description)
    end



end
