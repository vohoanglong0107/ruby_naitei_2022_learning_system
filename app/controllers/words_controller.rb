class WordsController < ApplicationController
  before_action :load_lesson, only: :index

  def index
    @words = @lesson
             .words
             .with_learned_by(current_user)
    respond_to do |format|
      format.html
      format.json{render json: @words}
    end
  end

  private
  def load_lesson
    @lesson = Lesson.find_by id: params[:lesson_id]
    return if @lesson.present?

    flash[:error] = t "lessons.lesson_not_found"
    redirect_to admin_root_path
  end
end
