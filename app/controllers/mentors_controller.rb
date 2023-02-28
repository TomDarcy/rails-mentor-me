class MentorsController < ApplicationController
<<<<<<< HEAD

=======
>>>>>>> 3512c57f58bd5cd9265743bb9f79e91a9ca36881
  def index
    @mentors = Mentor.all
  end

  def show
    @mentor = Mentor.find(params[:id])
  end
end
