class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    # binding.pry
  end

  def create
    # binding.pry
  end

  def show
  end

end

