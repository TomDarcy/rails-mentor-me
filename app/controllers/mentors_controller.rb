class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
  end

  def new
    @mentor = Mentor.new
  end

  def show
    @mentor = Mentor.find(params[:id])
  end
end
