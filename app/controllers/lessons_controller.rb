class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrolled_currently, only: [:show]

  def show
  end

  private

  def require_enrolled_currently
    if !current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), alert: "You're not currently enrolled yet."
    end
  end





  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
  
end
