class LessonsController < ApplicationController
  before_action :set_lesson, only: :show
  def show; end

  private
  def set_lesson
    @lesson = Lesson.find_by id: params[:id]
    return if @lesson.present?

    flash[:error] = t "lessons.lesson_not_found"
    redirect_to root_path
  end
end
