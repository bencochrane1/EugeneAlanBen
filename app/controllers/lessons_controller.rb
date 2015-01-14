class LessonsController < ApplicationController
  def index
    @lessons = current_account.projects.lessons.all
  end
end
