class Admin::WordsController < Admin::BaseController
  before_action :load_lesson, only: :index
  before_action :load_word, only: :destroy

  def index
    @words = @lesson ? @lesson.words : Word.all

    respond_to do |format|
      format.html
      format.json{render json: @words}
    end
  end

  def destroy
    if @word.destroy
      message_type = :success
      message = t ".success"
    else
      message_type = :error
      message = t ".error"
    end
    respond_to do |format|
      format.html do
        flash[message_type] = message
        redirect_back fallback_location: admin_root_path
      end
      format.json do
        if message_type == :success
          render json: {message: message}
        else
          render json: {message: message}, status: :unprocessable_entity
        end
      end
    end
  end

  private
  def load_lesson
    return unless params[:lesson_id]

    @lesson = Lesson.find_by id: params[:lesson_id]
    return if @lesson.present?

    flash[:error] = t "lessons.lesson_not_found"
    redirect_to admin_root_path
  end

  def load_word
    @word = Word.find_by id: params[:id]
    return if @word.present?

    flash[:error] = t "words.not_found"
    redirect_to admin_root_path
  end
end
